require 'test_helper'

class GerapdfsControllerTest < ActionController::TestCase
  setup do
    @gerapdf = gerapdfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gerapdfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gerapdf" do
    assert_difference('Gerapdf.count') do
      post :create, gerapdf: {  }
    end

    assert_redirected_to gerapdf_path(assigns(:gerapdf))
  end

  test "should show gerapdf" do
    get :show, id: @gerapdf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gerapdf
    assert_response :success
  end

  test "should update gerapdf" do
    put :update, id: @gerapdf, gerapdf: {  }
    assert_redirected_to gerapdf_path(assigns(:gerapdf))
  end

  test "should destroy gerapdf" do
    assert_difference('Gerapdf.count', -1) do
      delete :destroy, id: @gerapdf
    end

    assert_redirected_to gerapdfs_path
  end
end
