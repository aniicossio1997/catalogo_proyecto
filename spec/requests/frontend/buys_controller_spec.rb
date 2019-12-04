require "rails_helper"

RSpec.describe "Frontend::BuysController Requests", type: :request do
  describe 'Action "index"' do
    it 'Render correct template' do
      get '/buys'
      expect(response).to render_template(:index)
    end
  end

  #describe 'Action "show"' do
  #  it 'Render correct template' do
  #    get '/buys', params: { id: }
  #    expect(response).to render_template(:show)
  #  end
  #end
end
