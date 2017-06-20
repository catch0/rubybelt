class SessionsController < ApplicationController
    
    def create
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to '/ideas'
        else
            flash[:errors]="aww snap, did you forget to register, or did you forget your password?"
            redirect_to '/'
        end
    end
    
    def destroy
        reset_session
        redirect_to '/'
    end
    
    def login_params
        params.require(:login).permit(:email, :password)
    end
end
