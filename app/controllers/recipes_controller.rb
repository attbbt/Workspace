class RecipesController < ApplicationController

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = "Recipe was created successfully!"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was successfully updated!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  def like
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
    if like.valid?
      flash[:success] = "Your Selection was successful"
      redirect_to :back
    else
      flash[:error]  = "You can like/dislike a recipe once!"
      redirect_to :back
    end
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :picture)
  end

end
