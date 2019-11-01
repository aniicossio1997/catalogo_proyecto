# 
module Backend
  
  class UsersController < BackendController
    before_action :set_user, only: [
      :edit
    ]
    def index
      @users = User.all
    end

    def new; end

    def edit; end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def post_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
end
