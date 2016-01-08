# This controller serves as a base controller for other bookmarks_controllers.
# Posts::BookmarksController for example.
# Child controller that inherit from this BookmarksController should implement
# before_action :set_bookmarkable, which sets @bookmarkable.
class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.add_bookmark_to(@bookmarkable)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    Bookmark.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
