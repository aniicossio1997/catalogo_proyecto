module Backend
  class ClientsController < BackendController
    before_action :set_client, except: [
      :index
    ]
    def index
      @clients = User.clients
    end

    def destroy
      @client.destroy
    end

    private

    def set_client
      @client = User.find(params[:id])
    end

    def client_params
      params.require(:user).permit(:id)
    end
  end
end
