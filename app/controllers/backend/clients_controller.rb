# frozen_string_literal: true

module Backend
  class ClientsController < BackendController
    #authorize_resource class: false
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
        flash[:alert] = @client.errors[:error_user_destroy]
      else
        flash[:notice]= "Se elimino exitosamente"
      end
      redirect_to backend_clients_path
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
