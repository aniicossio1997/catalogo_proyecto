module Frontend
  class ItemController < FrontendController
    before_action :set_item

    def show; end

    def create; end

    private

    def set_item
      @item = Item.find(params[:id])
    end
  end
end
