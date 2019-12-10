# frozen_string_literal: true

module Backend
  class ClientsController < BackendController
    # authorize_resource class: false
    before_action :set_client, except: [
      :index
    ]
    before_action :authorize_buy
    def index
      @clients = User.clients
    end

    def show; end

    def destroy
      @client.destroy
      if @client.errors.present?
        flash.now[:alert] = @client.errors[:error_user_destroy].first
      else
        flash.now[:notice] = t(:action_without_errors,
                              element: :cliente,
                              action: :eliminado)
      end
    end

    private

    def authorize_buy
      authorize! :authorize_client, :backend_client
    end

    def set_client
      @client = User.find(params[:id])
    end

    def client_params
      params.require(:user).permit(:id)
    end
  end
end
