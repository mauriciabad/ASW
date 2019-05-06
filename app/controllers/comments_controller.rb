class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    respond_to do |format|
      format.html
      format.json { render json: @comments, status: :ok }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @comment, status: :ok }
    end
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @comment.issue
        respond_to do |format|
      format.html
      format.json { render json: @comment, status: :ok }
    end
#    respond_to do |format|
#      if comment.save
#        format.html { redirect_to comment, notice: 'Comment was successfully created.' }
#        format.json { render json: comment, status: :created }
#      else
#        format.html { render :new }
#        format.json { render json: comment.errors, status: :unprocessable_entity }
#      end
#    end
    
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    
    # logger.debug "Person attributes hash: #{comment_params[:text]}"
    # logger.debug "Person attributes hash: #{@comment.text}"
    @comment.update(comment_params)
    
    redirect_to @comment.issue
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render json: @comment, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json {render json: {message: 'Comment deleted successfully'},
                          status: :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      if @comment.nil?
        respond_to do |format|
          format.json { render json: { error: 'Comment not found' },
                               status: :not_found }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :issue_id, :user_id)
    end
end
