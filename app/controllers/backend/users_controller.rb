# frozen_string_literal: true

module Backend
  class UsersController < BackendController
    before_action :set_user, only: %i[edit
                                      update
                                      destroy]
    authorize_resource
    def index
      @users = User.admins
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.set_default_password
      @user.set_profile_admin
      if @user.save
        flash[:notice] = t(:action_without_errors,
                           element: :Usuario,
                           action: :creado)
        redirect_to backend_users_path
      else
        flash.now[:alert] = t(:action_error,
                              element: :Usuario,
                              action: :creado)
        render :new
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:notice] = t(:action_without_errors,
                           element: :Usuario,
                           action: :actualizado)
        redirect_to backend_users_path
      else
        flash.now[:alert] = t(:action_error,
                              element: :Usuario,
                              action: :actualizado)
        render :edit
      end
    end

    def destroy
      if @user != current_user
        @user.destroy
        flash[:notice] = t(:action_without_errors,
                           element: :Usuario,
                           action: :eliminado)
      else
        flash[:alert] = t(:action_error,
                          element: :Usuario,
                          action: :eliminado)
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
