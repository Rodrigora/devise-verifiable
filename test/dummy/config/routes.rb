Rails.application.routes.draw do

  devise_for :users
  # mount Devise::Verifiable::Engine => "/devise_verifiable"
end
