require "test_helper"

class Admin::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_subscriptions_edit_url
    assert_response :success
  end
end
