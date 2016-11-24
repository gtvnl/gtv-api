require 'test_helper'

class SensorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sensor = sensors(:one)
  end

  test "should get index" do
    get sensors_url, as: :json
    assert_response :success
  end

  test "should create sensor" do
    assert_difference('Sensor.count') do
      post sensors_url, params: { sensor: { name: @sensor.name, value: @sensor.value, sensor: @sensor.name } }, as: :json
    end

    assert_response 201
  end

  test "should show sensor" do
    get sensor_url(@sensor), as: :json
    assert_response :success
  end

  test "should update sensor" do
    patch sensor_url(@sensor), params: { sensor: { name: @sensor.name, value: @sensor.value, sensor: @sensor.name } }, as: :json
    assert_response 200
  end

  test "should destroy sensor" do
    assert_difference('Sensor.count', -1) do
      delete sensor_url(@sensor), as: :json
    end

    assert_response 204
  end
end
