class ChefsController < ApplicationController
 before_action :set_chef, only:[:show, :edit, :update]
 before_action :require_user, except:[:show,:index]
 before_action :require_same_user, only:[:edit, :update]
 before_action :require_user_destroy, only:[:detroy]

 def index
 @chefs =Chef.all

 end
 def edit

 end
 def show
 	@recipes=@chef.recipes.paginate(page:params[:page], per_page:4)

 end

 def update
   if @chef.update(chef_params)
      flash[:notice]= "Chef was successfully updated"
      redirect_to chef_path(@chef)
     else
       
       render :edit 
  
    end
 end
 def new
 	@chef= Chef.new

 end

 def create
 	@chef= Chef.create(chef_params)
 	if @chef.save
 		flash[:notice]="Chef created"
 		redirect_to chefs_path
 	else
 		flash[:notice]="Chef deleted successfully"
 	    render :new
 	end

 end
 def destroy
 	    chef.find(params[:id]).destroy
 	    flash[:notice]="Chef successfully deleted"
  	  redirect_to chef_path
 	  end
 private 
     def chef_params
     	params.require(:chef).permit(:name, :email, :password)
     end
     def set_chef
     	@chef=Chef.find(params[:id])
     end
   def require_same_user
      if @chef!=@chef or current_user.admin
        flash[:notice]="you can only edit your own profile"
        redirect_to root_path
       end
     end
    def require_user_destroy
      if !current_user.admin?
        flash[:notice]="You must be an admin to delete a user"
      redirect_to :back
       end
     end
  
end

