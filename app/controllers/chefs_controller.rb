class ChefsController < ApplicationController
 before_action :set_chef, only:[:show, :edit, :update]


 def index
 @chefs =Chef.all

 end
 def edit

 end
 def show

 end

 def update

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


 end

