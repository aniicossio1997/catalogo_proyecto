require "cancan/matchers"
require 'rails_helper'
# ...
RSpec.describe Ability, type: :model do

  describe 'abilities' do
    describe 'type user client' do
      let(:user){ create(:user, profile: Profile.client.take) }
      subject(:ability){ Ability.new(user) }
      context "when permission ok" do
        it{ is_expected.to be_able_to(:authorize_close_car, :frontend_cart) }
        it{ is_expected.to be_able_to(:authorize_buy_user_logged, :frontend_buy) }
      end
      context "when access denied" do
        it { is_expected.not_to be_able_to(:authorize_client, :backend_client) }
        it { is_expected.not_to be_able_to(:authorize_main, :backend_main) }
        it { is_expected.not_to be_able_to(:authorize_product, :backend_product)}
        it { is_expected.not_to be_able_to(:crud, :backend_buy) }
        it { is_expected.not_to be_able_to(:crud, :backend_buy) }
        it { is_expected.not_to be_able_to(:manage, Slider) }
        it { is_expected.not_to be_able_to(:manage, User) }
        it { is_expected.not_to be_able_to(:manage, Product) }
        it { is_expected.not_to be_able_to(:manage, Category) }
        it { is_expected.not_to be_able_to(:manage, Item) }
        it { is_expected.not_to be_able_to(:manage, Tag) }
        it { is_expected.not_to be_able_to(:manage, Config) }
      end
    end
    describe 'type user admin' do
      let(:user){ create(:user, profile: Profile.admin.take) }
      subject(:ability){ Ability.new(user) }
      it { is_expected.to be_able_to(:authorize_client, :backend_client) }
      it { is_expected.to be_able_to(:authorize_main, :backend_main) }
      it { is_expected.to be_able_to(:authorize_product, :backend_product)}
      it { is_expected.to be_able_to(:crud, :backend_buy) }
      it { is_expected.to be_able_to(:crud, :backend_buy) }
      it { is_expected.to be_able_to(:manage, Slider) }
      it { is_expected.to be_able_to(:manage, User) }
      it { is_expected.to be_able_to(:manage, Product) }
      it { is_expected.to be_able_to(:manage, Category) }
      it { is_expected.to be_able_to(:manage, Item) }
      it { is_expected.to be_able_to(:manage, Tag) }
      it { is_expected.to be_able_to(:manage, Config) }
    end
  end
end
