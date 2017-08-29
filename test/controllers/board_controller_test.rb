require 'test_helper'

class BoardControllerTest < ActionController::TestCase
  test "should get lb" do
    get :lb
    assert_response :success
  end

  test "should get cb" do
    get :cb
    assert_response :success
  end

end
