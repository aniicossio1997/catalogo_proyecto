#
module Backend

  class UsersController < BackendController
    before_action :set_user, only: [
      :edit,
      :update,
      :destroy

    ]
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      #byebug
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'Usuario creado'
        redirect_to backend_users_path
      else
        flash.now[:alert] = 'Error al crear usuario'
        render :new
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:notice] = 'Usuario modificado'
        redirect_to backend_users_path
      else
        flash.now[:alert] = 'Error al modificar usuario'
        render :edit
      end
    end

    def destroy
      if @user != current_user
        @user.destroy
        flash[:notice] = 'Usuario eliminado'
      else
        flash[:alert] = 'No se puede eliminar usted mismo'
      end
      redirect_to backend_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
end
