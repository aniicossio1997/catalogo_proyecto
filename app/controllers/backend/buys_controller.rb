module Backend
  class BuysController < BackendController
    def index
      @buys = Buy.all.decorate
    end

    def change_state_accept

    end
  end
end
