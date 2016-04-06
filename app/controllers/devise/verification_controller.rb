class Devise::VerificationController < DeviseController
  before_action :authenticate_scope!

  def new
  end

  def create
  end
end
