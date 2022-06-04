require "test_helper"

class Amin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get amin_orders_show_url
    assert_response :success
  end
end
