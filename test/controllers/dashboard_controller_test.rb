require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get superuser" do
    get :superuser
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get teilnehmer" do
    get :teilnehmer
    assert_response :success
  end

end
