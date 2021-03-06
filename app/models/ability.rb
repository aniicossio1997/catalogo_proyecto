# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if !user.profile.nil?  && user.profile.admin?
      alias_action :index, :state_change_accepted, :state_change_rejected, :show, to: :crud
      can :manage, Product
      can :manage, Category
      can :manage, Item
      can :manage, Tag
      can :manage, User
      can :manage, Config
      can :manage, User
      can :manage, Slider
      can :crud, :backend_buy
      can :authorize_product, :backend_product
      can :authorize_client, :backend_client
      can :authorize_main, :backend_main
    end
    if !user.profile.nil?
      can :authorize_close_car, :frontend_cart
      can :authorize_buy_user_logged, :frontend_buy
    end

  end

  # Define abilities for the passed in user here. For example:
  #
  #   user ||= User.new # guest user (not logged in)
  #   if user.admin?
  #     can :manage, :all
  #   else
  #     can :read, :all
  #   end
  #
  # The first argument to `can` is the action you are giving the user
  # permission to do.
  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on.
  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  # class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the
  # objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, :published => true
  #
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
