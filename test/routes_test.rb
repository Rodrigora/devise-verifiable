require 'test_helper'


class DefaultRoutingTest < ActionController::TestCase
  test 'map new user verification' do
    assert_recognizes(
      { controller:  'devise/verification',     action: 'new' },
      { path:        'users/verification/new',  method: :get }
    )
    assert_named_route "/users/verification/new", :new_user_verification_path
  end

  test 'map user verification' do
    assert_recognizes(
      { controller: 'devise/verification',  action: 'create' },
      { path:       'users/verification',   method: :post }
    )
    # assert_named_route "/users/sign_in", :user_session_path
  end

  protected

  def assert_named_route(result, *args)
    assert_equal result, @routes.url_helpers.send(*args)
  end
end
