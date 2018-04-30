require 'test_helper'

class Generated::TotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generated_toto = generated_totos(:one)
  end

  test "should get index" do
    get generated_totos_url
    assert_response :success
  end

  test "should get new" do
    get new_generated_toto_url
    assert_response :success
  end

  test "should create generated_toto" do
    assert_difference('Generated::Toto.count') do
      post generated_totos_url, params: { generated_toto: { name: @generated_toto.name } }
    end

    assert_redirected_to generated_toto_url(Generated::Toto.last)
  end

  test "should show generated_toto" do
    get generated_toto_url(@generated_toto)
    assert_response :success
  end

  test "should get edit" do
    get edit_generated_toto_url(@generated_toto)
    assert_response :success
  end

  test "should update generated_toto" do
    patch generated_toto_url(@generated_toto), params: { generated_toto: { name: @generated_toto.name } }
    assert_redirected_to generated_toto_url(@generated_toto)
  end

  test "should destroy generated_toto" do
    assert_difference('Generated::Toto.count', -1) do
      delete generated_toto_url(@generated_toto)
    end

    assert_redirected_to generated_totos_url
  end
end
