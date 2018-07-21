require 'test_helper'

class TimesheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timesheet = timesheets(:one)
  end

  test "should get index" do
    get timesheets_url, as: :json
    assert_response :success
  end

  test "should create timesheet" do
    assert_difference('Timesheet.count') do
      post timesheets_url, params: { timesheet: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show timesheet" do
    get timesheet_url(@timesheet), as: :json
    assert_response :success
  end

  test "should update timesheet" do
    patch timesheet_url(@timesheet), params: { timesheet: {  } }, as: :json
    assert_response 200
  end

  test "should destroy timesheet" do
    assert_difference('Timesheet.count', -1) do
      delete timesheet_url(@timesheet), as: :json
    end

    assert_response 204
  end
end
