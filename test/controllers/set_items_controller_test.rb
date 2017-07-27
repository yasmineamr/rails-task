require 'test_helper'

class SetItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @set_item = set_items(:one)
  end

  test "should get index" do
    get set_items_url
    assert_response :success
  end

  test "should get new" do
    get new_set_item_url
    assert_response :success
  end

  test "should create set_item" do
    assert_difference('SetItem.count') do
      post set_items_url, params: { set_item: { bundled_item_id: @set_item.bundled_item_id, item_id: @set_item.item_id, quantity: @set_item.quantity } }
    end

    assert_redirected_to set_item_url(SetItem.last)
  end

  test "should show set_item" do
    get set_item_url(@set_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_set_item_url(@set_item)
    assert_response :success
  end

  test "should update set_item" do
    patch set_item_url(@set_item), params: { set_item: { bundled_item_id: @set_item.bundled_item_id, item_id: @set_item.item_id, quantity: @set_item.quantity } }
    assert_redirected_to set_item_url(@set_item)
  end

  test "should destroy set_item" do
    assert_difference('SetItem.count', -1) do
      delete set_item_url(@set_item)
    end

    assert_redirected_to set_items_url
  end
end
