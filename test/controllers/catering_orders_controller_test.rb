require 'test_helper'

class CateringOrdersControllerTest < ActionController::TestCase
  setup do
    @catering_order = catering_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catering_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catering_order" do
    assert_difference('CateringOrder.count') do
      post :create, catering_order: {  }
    end

    assert_redirected_to catering_order_path(assigns(:catering_order))
  end

  test "should show catering_order" do
    get :show, id: @catering_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catering_order
    assert_response :success
  end

  test "should update catering_order" do
    patch :update, id: @catering_order, catering_order: {  }
    assert_redirected_to catering_order_path(assigns(:catering_order))
  end

  test "should destroy catering_order" do
    assert_difference('CateringOrder.count', -1) do
      delete :destroy, id: @catering_order
    end

    assert_redirected_to catering_orders_path
  end
end
