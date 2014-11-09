require 'test_helper'

class TrialsQuestionsControllerTest < ActionController::TestCase
  setup do
    @trials_question = trials_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trials_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trials_question" do
    assert_difference('TrialsQuestion.count') do
      post :create, trials_question: { id: @trials_question.id, question_id: @trials_question.question_id, trial_id: @trials_question.trial_id }
    end

    assert_redirected_to trials_question_path(assigns(:trials_question))
  end

  test "should show trials_question" do
    get :show, id: @trials_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trials_question
    assert_response :success
  end

  test "should update trials_question" do
    patch :update, id: @trials_question, trials_question: { id: @trials_question.id, question_id: @trials_question.question_id, trial_id: @trials_question.trial_id }
    assert_redirected_to trials_question_path(assigns(:trials_question))
  end

  test "should destroy trials_question" do
    assert_difference('TrialsQuestion.count', -1) do
      delete :destroy, id: @trials_question
    end

    assert_redirected_to trials_questions_path
  end
end
