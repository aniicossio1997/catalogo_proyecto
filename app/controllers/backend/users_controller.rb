module Backend
  class UsersController < BackendController
    before_action :set_user, only: [  :edit,
                                      :update,
                                      :destroy
                                   ]
    authorize_resource
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.set_default_password
      @user.set_profile_admin
      if @user.save
        flash[:notice] = '#Usar i18n'
        redirect_to backend_users_path
      else
        flash.now[:alert] = '#Usar i18n'
        render :new
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:notice] = '#Usar i18n'
        redirect_to backend_users_path
      else
        flash.now[:alert] = '#Usar i18n'
        render :edit
      end
    end

    def destroy
      if @user != current_user
        @user.destroy
        flash[:notice] = '#Usar i18n'
      else
        flash[:alert] = '#Usar i18n'
      end
      redirect_to backend_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email)
    end
  end
end
