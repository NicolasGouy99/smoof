require 'test_helper'

class Generated::TutusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generated_tutu = generated_tutus(:one)
  end

  test "should get index" do
    get generated_tutus_url
    assert_response :success
  end

  test "should get new" do
    get new_generated_tutu_url
    assert_response :success
  end

  test "should create generated_tutu" do
    assert_difference('Generated::Tutu.count') do
      post generated_tutus_url, params: { generated_tutu: { name: @generated_tutu.name } }
    end

    assert_redirected_to generated_tutu_url(Generated::Tutu.last)
  end

  test "should show generated_tutu" do
    get generated_tutu_url(@generated_tutu)
    assert_response :success
  end

  test "should get edit" do
    get edit_generated_tutu_url(@generated_tutu)
    assert_response :success
  end

  test "should update generated_tutu" do
    patch generated_tutu_url(@generated_tutu), params: { generated_tutu: { name: @generated_tutu.name } }
    assert_redirected_to generated_tutu_url(@generated_tutu)
  end

  test "should destroy generated_tutu" do
    assert_difference('Generated::Tutu.count', -1) do
      delete generated_tutu_url(@generated_tutu)
    end

    assert_redirected_to generated_tutus_url
  end
end
