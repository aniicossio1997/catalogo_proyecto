module Backend
  class ClientsController < BackendController
    def index
      
      @clients = User.clients
    end
  end
end
