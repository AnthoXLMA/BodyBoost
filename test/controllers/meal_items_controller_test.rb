require "test_helper"

class MealItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get meal_items_create_url
    assert_response :success
  end
end
