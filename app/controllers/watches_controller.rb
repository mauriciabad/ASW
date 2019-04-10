class WatchesController < ApplicationController
  before_action :find_issue
  before_action :find_watch, only: [:destroy]

  def create
    if current_user != nil
      if !watched
        @issue.watches.create(user_id: current_user.id)
      end
    end
    redirect_back fallback_location: root_path
  end
  
  def show
    if current_user != nil
      if !watched
        @issue.watches.create(user_id: current_user.id)
      end
    end
    redirect_back fallback_location: root_path
  end


  def destroy
    if (watched)
      @watch.destroy
    end
    redirect_back fallback_location: root_path
  end

  private
  def find_issue
    @issue = Issue.find(params[:issue_id])
  end

  def find_watch
    @watch = @issue.watches.find(params[:id])
  end



  def watched
  Watch.where(user_id: current_user.id, issue_id: params[:issue_id]).exists?
  end

end
