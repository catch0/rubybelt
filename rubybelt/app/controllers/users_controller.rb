class UsersController < ApplicationController
   
    def index
        
    end
    
    def create
    user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to '/ideas'
        else
            flash[:errors] = user.errors.full_messages
            redirect_to '/'
        end
    end
    
    def show
        @user = User.find(params[:id])
        @ideas = Idea.where(user_id: @user.id).count
        @likes = Like.where(user_id: @user.id).count
        
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end
end
