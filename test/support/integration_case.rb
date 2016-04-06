class ActiveSupport::IntegrationCase < ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Rails.application.routes.url_helpers
  include Warden::Test::Helpers

  def setup
    logout(:user)
  end

  def sign_in_user(user = nil, options = {})
    user = users(:john) unless user.present?

    visit new_user_session_path

    assert_equal current_path, '/users/sign_in'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: options[:password] || '12345678'

    click_button 'Log in'
    user
  end
end
