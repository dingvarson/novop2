require 'test_helper'

class CadDnsControllerTest < ActionController::TestCase
  setup do
    @cad_dn = cad_dns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cad_dns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cad_dn" do
    assert_difference('CadDn.count') do
      post :create, cad_dn: { cliente: @cad_dn.cliente, dns: @cad_dn.dns, email: @cad_dn.email, senha: @cad_dn.senha }
    end

    assert_redirected_to cad_dn_path(assigns(:cad_dn))
  end

  test "should show cad_dn" do
    get :show, id: @cad_dn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cad_dn
    assert_response :success
  end

  test "should update cad_dn" do
    put :update, id: @cad_dn, cad_dn: { cliente: @cad_dn.cliente, dns: @cad_dn.dns, email: @cad_dn.email, senha: @cad_dn.senha }
    assert_redirected_to cad_dn_path(assigns(:cad_dn))
  end

  test "should destroy cad_dn" do
    assert_difference('CadDn.count', -1) do
      delete :destroy, id: @cad_dn
    end

    assert_redirected_to cad_dns_path
  end
end
