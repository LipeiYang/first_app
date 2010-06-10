require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:microposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create micropost" do
    assert_difference('Micropost.count') do
      post :create, :micropost => { }
    end

    assert_redirected_to micropost_path(assigns(:micropost))
  end

  test "should show micropost" do
    get :show, :id => microposts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => microposts(:one).id
    assert_response :success
  end

  test "should update micropost" do
    put :update, :id => microposts(:one).id, :micropost => { }
    assert_redirected_to micropost_path(assigns(:micropost))
  end

  test "should destroy micropost" do
    assert_difference('Micropost.count', -1) do
      delete :destroy, :id => microposts(:one).id
    end

    assert_redirected_to microposts_path
  end
end
