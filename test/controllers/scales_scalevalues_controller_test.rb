require 'test_helper'

class ScalesScalevaluesControllerTest < ActionController::TestCase
  setup do
    @scales_scalevalue = scales_scalevalues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scales_scalevalues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scales_scalevalue" do
    assert_difference('ScalesScalevalue.count') do
      post :create, scales_scalevalue: { id: @scales_scalevalue.id, scale_id: @scales_scalevalue.scale_id, scalevalues_id: @scales_scalevalue.scalevalues_id }
    end

    assert_redirected_to scales_scalevalue_path(assigns(:scales_scalevalue))
  end

  test "should show scales_scalevalue" do
    get :show, id: @scales_scalevalue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scales_scalevalue
    assert_response :success
  end

  test "should update scales_scalevalue" do
    patch :update, id: @scales_scalevalue, scales_scalevalue: { id: @scales_scalevalue.id, scale_id: @scales_scalevalue.scale_id, scalevalues_id: @scales_scalevalue.scalevalues_id }
    assert_redirected_to scales_scalevalue_path(assigns(:scales_scalevalue))
  end

  test "should destroy scales_scalevalue" do
    assert_difference('ScalesScalevalue.count', -1) do
      delete :destroy, id: @scales_scalevalue
    end

    assert_redirected_to scales_scalevalues_path
  end
end
