require 'test_helper'

class TrialsUsersControllerTest < ActionController::TestCase
  setup do
    @trials_user = trials_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trials_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trials_user" do
    assert_difference('TrialsUser.count') do
      post :create, trials_user: { end_date: @trials_user.end_date, id: @trials_user.id, start_date: @trials_user.start_date, trial_id: @trials_user.trial_id, user_id: @trials_user.user_id }
    end

    assert_redirected_to trials_user_path(assigns(:trials_user))
  end

  test "should show trials_user" do
    get :show, id: @trials_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trials_user
    assert_response :success
  end

  test "should update trials_user" do
    patch :update, id: @trials_user, trials_user: { end_date: @trials_user.end_date, id: @trials_user.id, start_date: @trials_user.start_date, trial_id: @trials_user.trial_id, user_id: @trials_user.user_id }
    assert_redirected_to trials_user_path(assigns(:trials_user))
  end

  test "should destroy trials_user" do
    assert_difference('TrialsUser.count', -1) do
      delete :destroy, id: @trials_user
    end

    assert_redirected_to trials_users_path
  end
end
