require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get user:belongs_to" do
    get :user:belongs_to
    assert_response :success
  end

end
