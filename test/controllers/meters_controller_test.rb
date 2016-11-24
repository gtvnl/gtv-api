require 'test_helper'

class MetersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meter = meters(:one)
  end

  test "should get index" do
    get meters_url, as: :json
    assert_response :success
  end

  test "should create meter" do
    assert_difference('Meter.count') do
      post meters_url, params: { meter: { gpio: @meter.gpio, name: @meter.name, value: @meter.value } }, as: :json
    end

    assert_response 201
  end

  test "should show meter" do
    get meter_url(@meter), as: :json
    assert_response :success
  end

  test "should update meter" do
    patch meter_url(@meter), params: { meter: { gpio: @meter.gpio, name: @meter.name, value: @meter.value } }, as: :json
    assert_response 200
  end

  test "should destroy meter" do
    assert_difference('Meter.count', -1) do
      delete meter_url(@meter), as: :json
    end

    assert_response 204
  end
end
