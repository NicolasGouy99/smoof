require 'test_helper'

class Generated::TitisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generated_titi = generated_titis(:one)
  end

  test "should get index" do
    get generated_titis_url
    assert_response :success
  end

  test "should get new" do
    get new_generated_titi_url
    assert_response :success
  end

  test "should create generated_titi" do
    assert_difference('Generated::Titi.count') do
      post generated_titis_url, params: { generated_titi: { name: @generated_titi.name } }
    end

    assert_redirected_to generated_titi_url(Generated::Titi.last)
  end

  test "should show generated_titi" do
    get generated_titi_url(@generated_titi)
    assert_response :success
  end

  test "should get edit" do
    get edit_generated_titi_url(@generated_titi)
    assert_response :success
  end

  test "should update generated_titi" do
    patch generated_titi_url(@generated_titi), params: { generated_titi: { name: @generated_titi.name } }
    assert_redirected_to generated_titi_url(@generated_titi)
  end

  test "should destroy generated_titi" do
    assert_difference('Generated::Titi.count', -1) do
      delete generated_titi_url(@generated_titi)
    end

    assert_redirected_to generated_titis_url
  end
end
