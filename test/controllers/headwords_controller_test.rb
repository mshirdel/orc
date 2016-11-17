require 'test_helper'

class HeadwordsControllerTest < ActionController::TestCase
  setup do
    @headword = headwords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headwords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create headword" do
    assert_difference('Headword.count') do
      post :create, headword: {  }
    end

    assert_redirected_to headword_path(assigns(:headword))
  end

  test "should show headword" do
    get :show, id: @headword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @headword
    assert_response :success
  end

  test "should update headword" do
    patch :update, id: @headword, headword: {  }
    assert_redirected_to headword_path(assigns(:headword))
  end

  test "should destroy headword" do
    assert_difference('Headword.count', -1) do
      delete :destroy, id: @headword
    end

    assert_redirected_to headwords_path
  end
end
