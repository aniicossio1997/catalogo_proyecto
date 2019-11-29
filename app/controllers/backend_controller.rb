# frozen_string_literal: true

class BackendController < ApplicationController
  before_action :authenticate_user!
end
