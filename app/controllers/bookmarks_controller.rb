class BookmarksController < ApplicationController
    before_action :authenticate_user!
    def index
      @bm = current_user.bookmarked_balloons
      if @bm.size == 0 then
        @msg = "保存しているバルーンはありません"
      else
        @msg = ""
      end
    end
  
    def create
      @bm = current_user.bookmarks.new(balloon_id: params[:id], user_id: current_user.id)
      if @bm.save
        redirect_to controller: 'balloons', action: 'show'
      else
        redirect_to controller: 'balloons', action: 'show'
      end
    end
  
    def destroy
      @bm = Bookmark.find_by(balloon_id: params[:id], user_id: current_user.id)
      @bm.destroy
      redirect_to controller: 'bookmarks', action: 'index'
    end
  end
  
