require "test_helper"

class DirectoratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @directorates = directorates(:one)
  end

  test "should get index" do
    get directorates_url, as: :json
    assert_response :success
  end

  test "should create director" do
    assert_difference("Directorates.count") do
      post directorates_url, params: {directorate: {}}, as: :json
    end

    assert_response 201
  end

  test "should show director" do
    get director_url(@directorates), as: :json
    assert_response :success
  end

  test "should update director" do
    patch director_url(@directorates), params: {directorates: {}}, as: :json
    assert_response 200
  end

  test "should destroy director" do
    assert_difference("Directorates.count", -1) do
      delete director_url(@directorates), as: :json
    end

    assert_response 204
  end
end
