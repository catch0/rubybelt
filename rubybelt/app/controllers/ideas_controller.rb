class IdeasController < ApplicationController
    before_action :user_authorized, only: [:index, :create]
    def index
    @user = User.find(session[:user_id])
    @ideas = Idea.all
  	
  	@likes = Like.all
    end
    
    def create 
  	@idea = Idea.create(idea_params.merge(user:current_user))
    if @idea.valid?
      redirect_to '/ideas'
    else
      flash[:errors] = @idea.errors.full_messages 
      redirect_to '/ideas'
    end
    end
    
    def show
    @user = User.find(session[:user_id])
  	@idea = Idea.find(params[:id])
  	@likes = Like.all
    end
    
    def destroy
        Idea.destroy(params[:id])
        redirect_to '/ideas'
    end
    
    private 
    def idea_params
        params.require(:idea).permit(:content)
    end
end
