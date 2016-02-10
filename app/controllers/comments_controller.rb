class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_recipe
    before_action :require_user_comment, only: [:create, :update, :destrou]

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.chef_id = current_user.id
    @comment.recipe_id = @recipe.id

    if @comment.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def require_user_comment
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
       redirect_to :back
       end
    end
end
