require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test 'verification page shows form with fields for verification' do
    sign_in_user
    visit new_user_verification_path

    assert_current_path '/users/verification/new'

    assert_text 'Full name'
    assert_text 'Address'
    assert_button 'Verify'
  end

  test 'verifies the user filling all fields for verification' do
    sign_in_user
    visit new_user_verification_path

    fill_in 'user_full_name', with: 'John Doe'
    fill_in 'user_address', with: '555, 5th Street'

    click_button 'Verify'

    assert_current_path root_path
    assert_text 'Your account has been verified!'
  end

  test 'shows errors messages when invalid user' do
    sign_in_user
    visit new_user_verification_path

    click_button 'Verify'

    assert_current_path user_verification_path

    assert_text 'Full name can\'t be blank'
    assert_text 'Address can\'t be blank'
  end
end
