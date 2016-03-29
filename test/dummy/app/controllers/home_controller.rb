class HomeController < ApplicationController
  before_action :authenticate_verified_user!

  def index
  end
end
