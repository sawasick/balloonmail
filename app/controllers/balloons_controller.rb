# coding: utf-8

class BalloonsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def index
    end
  
    def show
      bchoice = (1..Balloon.count).to_a.sample(5)
      @b = Balloon.find(bchoice)
    end
  
    def detail
      @b = Balloon.find(params[:id])
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
  
  
    def balloon_params
      params.require(:balloon).permit(:title, :content, :date)
    end
  
  end