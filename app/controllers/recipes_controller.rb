class RecipesController < ApplicationController
   before_action :set_recipe, only:[:show, :edit, :update]	
  def index 
  	@recipes=Recipe.all

  end

  def edit
  

  end
  def update

    if @recipe.update(recipe_params)
      flash[:notice]= "Recipe was successfully updated"
      redirect_to recipes_url(@recipe)
     else
       
       render :edit 
  
    end
  end
  def show

  end
  def new
  	@recipe= Recipe.new
  end
  def create
    @chef=Chef.first
    @recipe=Recipe.new(recipe_params)
    @recipe.chef=@chef
    if @recipe.save
    	flash[:notice]= "Recipe has been saved"
    	redirect_to recipes_path
    else
       flash[:notice]="Recipe failed to be saved"
       render :new	
    end
  end
  def destroy
  	Recipe.find(params[:id]).destroy
  	flash[:notice]="Recipe successfully deleted"
  	redirect_to recipes_path
  end

  
   private 
     def recipe_params
     	params.require(:recipe).permit(:name, :picture, :summary, :description,:chef_id)
     end
     def set_recipe
     	@recipe=Recipe.find(params[:id])
     end
    
    



  
end