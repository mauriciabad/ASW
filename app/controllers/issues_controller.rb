class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy, :vote]

  # GET /issues
  # GET /issues.json
  
  def index
    @users = User.all
    #status
    if params[:status] == "open"
      @issues = Issue.where(status: "open")
    elsif params[:status] == "onhold"
      @issues = Issue.where(status: "onhold")
    elsif params[:status] == "resolved"
      @issues = Issue.where(status: "resolved")
    elsif params[:status] == "duplicate"
      @issues = Issue.where(status: "duplicate")
    elsif params[:status] == "invalid"
      @issues = Issue.where(status: "invalid")
    elsif params[:status] == "wontfix"
      @issues = Issue.where(status: "wontfix")
    elsif params[:status] == "closed"
      @issues = Issue.where(status: "closed")
    #type
    elsif params[:kind] == "bug"
      @issues = Issue.where(kind: "bug")
    elsif params[:kind] == "enhancement"
      @issues = Issue.where(kind: "enhancement")
    elsif params[:kind] == "proposal"
      @issues = Issue.where(kind: "proposal")
    elsif params[:kind] == "task"
      @issues = Issue.where(kind: "task")
    #priority
    elsif params[:priority] == "major"
      @issues = Issue.where(priority: "major")
    elsif params[:priority] == "minor"
      @issues = Issue.where(priority: "minor")
    elsif params[:priority] == "trivial"
      @issues = Issue.where(priority: "trivial")
    elsif params[:priority] == "blocker"
      @issues = Issue.where(priority: "blocker")
    elsif params[:priority] == "critical"
      @issues = Issue.where(priority: "critical")
    #my issues
    elsif params[:my_issues] == "me"
      @issues = Issue.where(user_id: current_user.id)
    #watching
    elsif params[:watching] == "me"
      @issues = Issue.joins(:watches).where(['watches.issue_id = issues.id AND watches.user_id = ?', current_user.id])
    #all
    else
      @issues = Issue.all
    end
  end
  
  # GET /issues/1
  # GET /issues/1.json
  def show
    @comments = @issue.comment.all
    @users = User.all
    @lines = Line.all
  end

  # GET /issues/new
  def new
    @issue = Issue.new()
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.assigned_user = current_user.name
    @issue.user_id = current_user.id
    @issue.votesCount = 0
    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    
        # logger.debug "Person attributes hash: #{comment_params[:text]}"
        # logger.debug "Person attributes hash: #{@comment.text}"
        
        comment = @issue.comment.new(text: '', issue_id: @issue.id , user_id: current_user.id)
        comment.save
        
        if issue_params[:status] != @issue.status
          message = "changed status to #{issue_params[:status]}"
          line = Line.new(text: message, comment_id: comment.id)
          line.save
        end
        if issue_params[:title] != @issue.title
          message = "changed title to #{issue_params[:title]}"
          line = Line.new(text: message, comment_id: comment.id)
          line.save
        end
        if issue_params[:description] != @issue.description
          message = "edited description"
          line = Line.new(text: message, comment_id: comment.id)
          line.save
        end
        if issue_params[:kind] != @issue.kind
          message = "marked as #{issue_params[:kind]}"
          line = Line.new(text: message, comment_id: comment.id)
          line.save
        end
        if issue_params[:priority] != @issue.priority
          message = "marked as #{issue_params[:priority]}"
          line = Line.new(text: message, comment_id: comment.id)
          line.save
        end
        
        
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def vote 
   @issue.votesCount = @issue.votesCount + 1
   @issue.save
   redirect_back(fallback_location: root_path)
   
  end
  
  def watch 
    
   @watch = @issue.watches.create
   w = Watch.create
   @issue.watch = w
   flash[:notice] = "CREAT"
   redirect_back(fallback_location: root_path)
   
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :description, :kind, :priority, :user_id, :status, :votesCount, :assigned_user)
    end
end
