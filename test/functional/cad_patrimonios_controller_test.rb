require 'test_helper'

class CadPatrimoniosControllerTest < ActionController::TestCase
  setup do
    @cad_patrimonio = cad_patrimonios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cad_patrimonios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cad_patrimonio" do
    assert_difference('CadPatrimonio.count') do
      post :create, cad_patrimonio: { cliente: @cad_patrimonio.cliente, descricao: @cad_patrimonio.descricao, tipo_contrato: @cad_patrimonio.tipo_contrato }
    end

    assert_redirected_to cad_patrimonio_path(assigns(:cad_patrimonio))
  end

  test "should show cad_patrimonio" do
    get :show, id: @cad_patrimonio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cad_patrimonio
    assert_response :success
  end

  test "should update cad_patrimonio" do
    put :update, id: @cad_patrimonio, cad_patrimonio: { cliente: @cad_patrimonio.cliente, descricao: @cad_patrimonio.descricao, tipo_contrato: @cad_patrimonio.tipo_contrato }
    assert_redirected_to cad_patrimonio_path(assigns(:cad_patrimonio))
  end

  test "should destroy cad_patrimonio" do
    assert_difference('CadPatrimonio.count', -1) do
      delete :destroy, id: @cad_patrimonio
    end

    assert_redirected_to cad_patrimonios_path
  end
end
