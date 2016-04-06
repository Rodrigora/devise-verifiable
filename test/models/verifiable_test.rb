require 'test_helper'

class VerifiableTest < ActiveSupport::TestCase

  test 'Devise configuration' do
    assert_equal User.fields_for_verification, [:full_name, :address]
  end

  test 'refuting when user isnt verified' do
    refute User.new.verified?
  end

  test 'asserting when user is verified' do
    user = User.new(full_name: 'Rodrigo Ra', address: '501, My Address')

    assert user.verified?
  end

  test 'adding errors for empty fields for verification' do
    john = users(:john)

    refute john.valid_for_verification?

    assert_equal 2, john.errors.size
    assert_not_nil john.errors[:full_name]
    assert_not_nil john.errors[:address]

    assert_equal ['can\'t be blank'], john.errors[:full_name]
    assert_equal ['can\'t be blank'], john.errors[:address]
  end
end
