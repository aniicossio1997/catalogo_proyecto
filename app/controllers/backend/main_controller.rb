# frozen_string_literal: true

module Backend
  class MainController < BackendController
    before_action :authorize_main
    def index; end

    private

    def authorize_main
      authorize! :authorize_main, :backend_main
    end
  end
end
