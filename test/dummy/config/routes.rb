Rails.application.routes.draw do

  mount Devise::Verifiable::Engine => "/devise_verifiable"
end
