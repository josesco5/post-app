require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "invalid without a name" do
    p = posts(:one)
    p.name = nil
    assert_not p.valid?, "Post must have a name"
  end
end
