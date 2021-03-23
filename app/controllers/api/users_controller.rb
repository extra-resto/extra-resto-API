class Api::UsersController < Api::BaseController

    before_action :find_user, only: %w[show]
  
    def show
      render json: @user, include: [:businesses, :events, :jobs]
    end

    private
  
    def find_user
      @user = User.find(params[:id])
    end
  
end