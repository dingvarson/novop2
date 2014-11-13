require 'test_helper'

class DadosServersControllerTest < ActionController::TestCase
  setup do
    @dados_server = dados_servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dados_servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dados_server" do
    assert_difference('DadosServer.count') do
      post :create, dados_server: { email: @dados_server.email, senha: @dados_server.senha }
    end

    assert_redirected_to dados_server_path(assigns(:dados_server))
  end

  test "should show dados_server" do
    get :show, id: @dados_server
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dados_server
    assert_response :success
  end

  test "should update dados_server" do
    put :update, id: @dados_server, dados_server: { email: @dados_server.email, senha: @dados_server.senha }
    assert_redirected_to dados_server_path(assigns(:dados_server))
  end

  test "should destroy dados_server" do
    assert_difference('DadosServer.count', -1) do
      delete :destroy, id: @dados_server
    end

    assert_redirected_to dados_servers_path
  end
end
