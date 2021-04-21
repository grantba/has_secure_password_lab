class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:notice] = "There was an issue signing you up. Please make sure you have a name and password." 
            redirect_to '/signup'
        end
    end

    def homepage
        if logged_in?
            render :homepage
        else
            redirect_to login_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
