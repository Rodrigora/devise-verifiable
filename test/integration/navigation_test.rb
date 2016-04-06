require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test 'root path requires users authentication' do
    visit root_path

    assert_equal current_path, '/users/sign_in'
  end

  test 'unverified user is redirected to verification' do
    sign_in_user
    visit root_path

    assert_equal current_path, '/users/verification/new'
  end

  test 'verified user is not redirected to verification' do
    sign_in_user users(:verified_john)
    visit root_path

    assert_equal current_path, root_path
  end
end

