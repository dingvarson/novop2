require 'test_helper'

class RptClisControllerTest < ActionController::TestCase
  setup do
    @rpt_cli = rpt_clis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rpt_clis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rpt_cli" do
    assert_difference('RptCli.count') do
      post :create, rpt_cli: {  }
    end

    assert_redirected_to rpt_cli_path(assigns(:rpt_cli))
  end

  test "should show rpt_cli" do
    get :show, id: @rpt_cli
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rpt_cli
    assert_response :success
  end

  test "should update rpt_cli" do
    put :update, id: @rpt_cli, rpt_cli: {  }
    assert_redirected_to rpt_cli_path(assigns(:rpt_cli))
  end

  test "should destroy rpt_cli" do
    assert_difference('RptCli.count', -1) do
      delete :destroy, id: @rpt_cli
    end

    assert_redirected_to rpt_clis_path
  end
end
