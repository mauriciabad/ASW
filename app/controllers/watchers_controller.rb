class WatchersController < ApplicationController
  before_action :find_issue
  before_action :find_watch, only: [:destroy]

  def create
    if current_user != nil
      if watched
        flash[:notice] = "Already Watched"
      else
        @issue.watchers.create(user_id: current_user.id)
        flash[:notice] = "You are now watching issue #{@issue.id}"
      end
    else
      flash[:notice] = "Cannot watch if you're not logged in"
    end
    redirect_back fallback_location: root_path
  end


  def destroy
    if !(watched)
      flash[:notice] = "Cannot unwatch"
    else
      @watch.destroy
    end
    redirect_back fallback_location: root_path
  end

  private
  def find_issue
    @issue = Issue.find(params[:issue_id])
  end

  def find_watch
    @watch = @issue.watchers.find(params[:id])
  end



  def watched
  Watch.where(user_id: current_user.id, issue_id:
    params[:issue_id]).exists?
  end

end
