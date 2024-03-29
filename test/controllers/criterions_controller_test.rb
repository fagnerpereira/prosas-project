require "test_helper"

class CriterionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criterion = criterions(:one)
  end

  test "should get index" do
    get criterions_url
    assert_response :success
  end

  test "should get new" do
    get new_criterion_url
    assert_response :success
  end

  test "should create criterion" do
    assert_difference("Criterion.count") do
      post criterions_url, params: { criterion: { name: @criterion.name, weight: @criterion.weight } }
    end

    assert_redirected_to criterion_url(Criterion.last)
  end

  test "should show criterion" do
    get criterion_url(@criterion)
    assert_response :success
  end

  test "should get edit" do
    get edit_criterion_url(@criterion)
    assert_response :success
  end

  test "should update criterion" do
    patch criterion_url(@criterion), params: { criterion: { name: @criterion.name, weight: @criterion.weight } }
    assert_redirected_to criterion_url(@criterion)
  end

  test "should destroy criterion" do
    assert_difference("Criterion.count", -1) do
      delete criterion_url(@criterion)
    end

    assert_redirected_to criterions_url
  end
end
