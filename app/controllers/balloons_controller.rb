# coding: utf-8

class BalloonsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def show
    clear()
    ball = Balloon.pluck(:id)
    if ball.size < 5 then
      bchoice = ball
    else
      bchoice = ball.to_a.sample(5)
    end
    @b = Balloon.find(bchoice)
  end

  def show_mine
    @b = Balloon.where(user_id: current_user.id)
    @show_mine = true
    render "show"
  end

  def detail
    @b = Balloon.find(params[:id])
    @u = User.find(@b.user_id).username
    @d = @b.date.strftime("%Y年%m月%d日 %H:%M")
    @bm = Bookmark.new
  end

  def new
    @balloon = current_user.balloons.new(
        user_id: current_user.id,
        title: 'tmp',
        content: 'tmp',
        date: DateTime.current,
        paperType: params[:paperType]
    )
    @balloon.save
    @balloon.title = nil
    @balloon.content = nil

  end

  def create
    @balloon = current_user.balloons.new(balloon_params)
    @balloon.date = DateTime.current
    if @balloon.save then
      redirect_to balloons_url
    else
      render 'new'
    end
  end

  def update
    @balloon = Balloon.find(params[:id])
    @balloon.update(balloon_params)
    @balloon.date = DateTime.current
    if @balloon.save then
      redirect_to balloons_url
    else
      render 'new'
    end
  end
  
  #tmpを削除
  def clear
    ball = Balloon.pluck(:id)
    for i in ball do
        @bb = Balloon.find(i)
        @c = @bb.created_at
        @u = @bb.updated_at
        if @c == @u then
          @bb.destroy
        end
    end
  end

  def setting
  end

  def balloon_params
    params.require(:balloon).permit(:title, :content, :date)
  end

end