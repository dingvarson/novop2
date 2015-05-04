require 'test_helper'

class DescrServersControllerTest < ActionController::TestCase
  setup do
    @descr_server = descr_servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:descr_servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create descr_server" do
    assert_difference('DescrServer.count') do
      post :create, descr_server: { cliente: @descr_server.cliente, dns: @descr_server.dns }
    end

    assert_redirected_to descr_server_path(assigns(:descr_server))
  end

  test "should show descr_server" do
    get :show, id: @descr_server
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @descr_server
    assert_response :success
  end

  test "should update descr_server" do
    put :update, id: @descr_server, descr_server: { cliente: @descr_server.cliente, dns: @descr_server.dns }
    assert_redirected_to descr_server_path(assigns(:descr_server))
  end

  test "should destroy descr_server" do
    assert_difference('DescrServer.count', -1) do
      delete :destroy, id: @descr_server
    end

    assert_redirected_to descr_servers_path
  end
end
