require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test 'root path requires users authentication' do
    visit root_path

    assert_equal current_path, '/users/sign_in'
  end
end

