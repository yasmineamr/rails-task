require 'test_helper'

class BundledItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bundled_item = bundled_items(:one)
  end

  test "should get index" do
    get bundled_items_url
    assert_response :success
  end

  test "should get new" do
    get new_bundled_item_url
    assert_response :success
  end

  test "should create bundled_item" do
    assert_difference('BundledItem.count') do
      post bundled_items_url, params: { bundled_item: { discounted_price: @bundled_item.discounted_price, title: @bundled_item.title } }
    end

    assert_redirected_to bundled_item_url(BundledItem.last)
  end

  test "should show bundled_item" do
    get bundled_item_url(@bundled_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_bundled_item_url(@bundled_item)
    assert_response :success
  end

  test "should update bundled_item" do
    patch bundled_item_url(@bundled_item), params: { bundled_item: { discounted_price: @bundled_item.discounted_price, title: @bundled_item.title } }
    assert_redirected_to bundled_item_url(@bundled_item)
  end

  test "should destroy bundled_item" do
    assert_difference('BundledItem.count', -1) do
      delete bundled_item_url(@bundled_item)
    end

    assert_redirected_to bundled_items_url
  end
end
