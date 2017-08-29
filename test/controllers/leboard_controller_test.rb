require 'test_helper'

class LeboardControllerTest < ActionController::TestCase
  test "should get lb" do
    get :lb
    assert_response :success
  end

end
