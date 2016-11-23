require 'test_helper'

class GpiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gpio = gpios(:one)
  end

  test "should get index" do
    get gpios_url, as: :json
    assert_response :success
  end

  test "should create gpio" do
    assert_difference('Gpio.count') do
      post gpios_url, params: { gpio: { gpio_number: @gpio.gpio_number, name: @gpio.name, of_type: @gpio.of_type, pin: @gpio.pin } }, as: :json
    end

    assert_response 201
  end

  test "should show gpio" do
    get gpio_url(@gpio), as: :json
    assert_response :success
  end

  test "should update gpio" do
    patch gpio_url(@gpio), params: { gpio: { gpio_number: @gpio.gpio_number, name: @gpio.name, of_type: @gpio.of_type, pin: @gpio.pin } }, as: :json
    assert_response 200
  end

  test "should destroy gpio" do
    assert_difference('Gpio.count', -1) do
      delete gpio_url(@gpio), as: :json
    end

    assert_response 204
  end
end
