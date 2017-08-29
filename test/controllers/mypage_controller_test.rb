require 'test_helper'

class MypageControllerTest < ActionController::TestCase
  test "should get mp" do
    get :mp
    assert_response :success
  end

  test "should get cpg" do
    get :cpg
    assert_response :success
  end

end
