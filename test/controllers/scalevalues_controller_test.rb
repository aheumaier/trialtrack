require 'test_helper'

class ScalevaluesControllerTest < ActionController::TestCase
  setup do
    @scalevalue = scalevalues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scalevalues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scalevalue" do
    assert_difference('Scalevalue.count') do
      post :create, scalevalue: { description: @scalevalue.description, id: @scalevalue.id, value: @scalevalue.value }
    end

    assert_redirected_to scalevalue_path(assigns(:scalevalue))
  end

  test "should show scalevalue" do
    get :show, id: @scalevalue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scalevalue
    assert_response :success
  end

  test "should update scalevalue" do
    patch :update, id: @scalevalue, scalevalue: { description: @scalevalue.description, id: @scalevalue.id, value: @scalevalue.value }
    assert_redirected_to scalevalue_path(assigns(:scalevalue))
  end

  test "should destroy scalevalue" do
    assert_difference('Scalevalue.count', -1) do
      delete :destroy, id: @scalevalue
    end

    assert_redirected_to scalevalues_path
  end
end
