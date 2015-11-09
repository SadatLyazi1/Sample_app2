class RecipesController < ApplicationController
   before_action :set_recipe, only:[:show, :edit, :update,:like]	
   before_action :require_user, except: [:show,:index]
   before_action :require_user_like, only:[:like]
   before_action :require_same_user, only: [:edit,:update]
   before_action :admin_user, only:[:destroy]


  def index 

  	@recipes=Recipe.paginate(page: params[:page],per_page: 4)
  
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

 
 def like
    like =Like.create(like: params[:like],chef: current_user, recipe: @recipe)
     if like.valid?
        flash[:success]= "Your selection was successful"
        #require pry; binding.pry 
        redirect_to :back
    else
       flash[:danger]="You can only like/dislike once"
       redirect_to :back    

     end
  end


  def create
    @recipe=Recipe.new(recipe_params)
    @recipe.chef=current_user
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
     	params.require(:recipe).permit(:name, :picture, :summary, :description, :recipe_id,style_ids:[], ingredient_ids:[],review_ids:[])
     end
     def set_recipe
     	@recipe=Recipe.find(params[:id])
     end

     def require_same_user
      if current_user !=@recipe.chef and !current_user.admin
        flash[:danger]="you can only edit your own recipe"
      redirect_to recipes_path
       end
     end
     def require_user_like
      if !logged_in?
        flash[:danger]="You must be logged in to like"
      redirect_to :back
       end
     end

     def admin_user
     redirect_to recipes_path unless current_user.admin?
     end
end
