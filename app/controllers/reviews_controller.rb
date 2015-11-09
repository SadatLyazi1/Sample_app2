class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show,:index]
  before_action :require_same_user, only: [:edit,:update]

 
  def index
    
  end

 
  def show
    # @recipe = Recipe.find(params[:id])
    # @review = Review.find(params[:id])
  end

  end

  def new
    @review = Review.new
  end

  
  def edit

  	 @recipe = Recipe.find(params[:id])
     @review = Review.find(params[:id])
  end
   def create
    # @recipe = Recipe.find(params[:recipe_id])
    # @review = @review.reviews.build(params[:id])

    # if @review.save
    #   flash[:notice] = 'Review was successfully created.'
    #   redirect_to reviews_url(@review)
    # else
    #   flash[:notice] = "review not created"
    #   redirect_to reviews_url(@review)
    # end

    @review=Review.new(review_params)
    @review.chef=current_user
    if @review.save
      flash[:notice]= "Review was successfully created"
      redirect_to recipes_path
    else
       flash[:notice]="review not created"
       render :new  
    end
  end
  
  def update
       if @review.update(review_params)
      flash[:notice]= "Review was successfully updated"
      redirect_to reviews_url(@review)
     else
       
       render :edit 
    end
  end

 
  def destroy
    Review.find(params[:id]).destroy
    flash[:notice]="Review successfully deleted"
    redirect_to recipes_path
  end


  private
      def set_review
        @review = Review.find(params[:id])
      end

      def review_params
        params.require(:review).permit(:name, :body)
      end
#   def require_user_review
#       if !logged_in?
#         flash[:danger]="You must be logged in to Review"
#       redirect_to :back
#        end
#      end
#    end

# 

      def require_same_user
      if current_user !=@review.chef and !current_user.admin
        flash[:danger]="you can only edit your own recipe"
      redirect_to recipes_path
       end
     end
    




end
