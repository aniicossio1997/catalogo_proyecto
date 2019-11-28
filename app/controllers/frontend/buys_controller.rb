module Frontend
    class BuysController < FrontendController
        def index
            @buys = Buy.all
        end
        def show
            
            @buy = Buy.find(params[:id])
        end
    end
end