require 'test_helper'

class AnotacaosControllerTest < ActionController::TestCase
  setup do
    @anotacao = anotacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anotacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anotacao" do
    assert_difference('Anotacao.count') do
      post :create, anotacao: { nome: @anotacao.nome }
    end

    assert_redirected_to anotacao_path(assigns(:anotacao))
  end

  test "should show anotacao" do
    get :show, id: @anotacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anotacao
    assert_response :success
  end

  test "should update anotacao" do
    put :update, id: @anotacao, anotacao: { nome: @anotacao.nome }
    assert_redirected_to anotacao_path(assigns(:anotacao))
  end

  test "should destroy anotacao" do
    assert_difference('Anotacao.count', -1) do
      delete :destroy, id: @anotacao
    end

    assert_redirected_to anotacaos_path
  end
end
