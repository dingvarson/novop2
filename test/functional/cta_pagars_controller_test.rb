require 'test_helper'

class CtaPagarsControllerTest < ActionController::TestCase
  setup do
    @cta_pagar = cta_pagars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cta_pagars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cta_pagar" do
    assert_difference('CtaPagar.count') do
      post :create, cta_pagar: { datavencto: @cta_pagar.datavencto, descricao: @cta_pagar.descricao, nomeforn: @cta_pagar.nomeforn, valor: @cta_pagar.valor }
    end

    assert_redirected_to cta_pagar_path(assigns(:cta_pagar))
  end

  test "should show cta_pagar" do
    get :show, id: @cta_pagar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cta_pagar
    assert_response :success
  end

  test "should update cta_pagar" do
    put :update, id: @cta_pagar, cta_pagar: { datavencto: @cta_pagar.datavencto, descricao: @cta_pagar.descricao, nomeforn: @cta_pagar.nomeforn, valor: @cta_pagar.valor }
    assert_redirected_to cta_pagar_path(assigns(:cta_pagar))
  end

  test "should destroy cta_pagar" do
    assert_difference('CtaPagar.count', -1) do
      delete :destroy, id: @cta_pagar
    end

    assert_redirected_to cta_pagars_path
  end
end
