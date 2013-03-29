require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:rato).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end
  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end
  test "that varialbes are assigned on sucessful profile viewing" do
    get :show, id: users(:rato).profile_name
    assert assigns(:user)
    assert_not_empty assigns (:statuses)
  end
  test "only shows the correct user's statuses" do
    get :show, id: users(:rato).profile_name
    assigns(:statuses).each do |status|
      assert_equal users(:rato), status.user
    end
  end
end
class ActionController::TestCase
  include Devise::TestHelpers
end