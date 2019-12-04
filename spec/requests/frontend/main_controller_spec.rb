require "rails_helper"

RSpec.describe "Frontend::MainController Requests", type: :request do
  describe 'Action "home"' do
    it 'Render correct template' do
      get '/'
      expect(response).to render_template(:home)
    end
  end
end
