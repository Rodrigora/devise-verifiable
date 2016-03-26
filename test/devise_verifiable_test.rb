require 'test_helper'

class DeviseVerifiableTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Devise::Verifiable
  end
end
