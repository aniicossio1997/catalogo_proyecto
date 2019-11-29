module Backend
  class ClientsController < BackendController
    before_action :set_client, except: [
      :index
    ]
    def index
      @clients = User.clients
    end

    def show; end

    def destroy
      @client.destroy
      if @client.errors.present?
        flash[:alert] = @client.errors[:base].to_s
      else
        flash[:notice]= "Se elimino exitosamente"
      end
      #Usar i18n
      redirect_to backend_clients_path
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
