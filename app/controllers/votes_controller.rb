class VotesController < ApplicationController
  before_action :find_issue
  before_action :find_vote, only: [:destroy]

  # POST /issues/:issue_id/vote
  # POST /issues/:issue_id/vote.json
  def create
    if current_user != nil
      if !voted
        @issue.votes.create(user_id: current_user.id)
        message = 'Issue voted'
      else
        message = 'Issue voted'
      end
    end
    ##redirect_to issue_path(@issue)
      respond_to do |format|
          format.html
      #format.html { redirect_to "/issues/#{ @issue.id }" }
      format.json { render json: { message: message }, status: :ok }
    end
  end

  def destroy
    if voted
      @vote.destroy
    end
    redirect_to issue_path(@issue)
  end

  private
  def find_issue
    @issue = Issue.find(params[:issue_id])
  end

  def find_vote
   @vote = @issue.votes.find(params[:id])
  end

  def voted
  Vote.where(user_id: current_user.id, issue_id: params[:issue_id]).exists?
  end
end


