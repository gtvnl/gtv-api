require 'test_helper'

class SetpointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setpoint = setpoints(:one)
  end

  test "should get index" do
    get setpoints_url, as: :json
    assert_response :success
  end

  test "should create setpoint" do
    assert_difference('Setpoint.count') do
      post setpoints_url, params: { setpoint: { name: @setpoint.name, value: @setpoint.value } }, as: :json
    end

    assert_response 201
  end

  test "should show setpoint" do
    get setpoint_url(@setpoint), as: :json
    assert_response :success
  end

  test "should update setpoint" do
    patch setpoint_url(@setpoint), params: { setpoint: { name: @setpoint.name, value: @setpoint.value } }, as: :json
    assert_response 200
  end

  test "should destroy setpoint" do
    assert_difference('Setpoint.count', -1) do
      delete setpoint_url(@setpoint), as: :json
    end

    assert_response 204
  end
end
