class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.all 
  end 

  def new
    @user = User.new
  end 

  def create

    @user = User.new(user_params)
      if @user.save
        #flash success 
        log_in @user
        flash[:success] = "Welcome to the App"
        redirect_to root_path
        else 
          render "new"
          #fash danger 

      end
  end 


  def edit
     @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  user_params = params.require(:user).permit(:first_name, :last_name, :email, :password,
                                            :password_confirmation)
  @user.update(user_params)
  redirect_to users_path 
  end

  def destroy
  end

private 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                :password_confirmation)
  end

end
