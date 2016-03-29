require 'test_helper'

class VerifiableTest < ActiveSupport::TestCase

  setup do
    # validating Devise configuration
    assert_equal User.fields_for_verification, [:full_name, :address]
  end

  test 'refuting when user isnt verified' do
    refute User.new.verified?
  end

  test 'asserting when user is verified' do
    user = User.new(full_name: 'Rodrigo Ra', address: '501, My Address')

    assert user.verified?
  end
end
