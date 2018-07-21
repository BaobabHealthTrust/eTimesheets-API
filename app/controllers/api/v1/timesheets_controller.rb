class Api::V1::TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:show, :update, :destroy]

  # GET /timesheets
  def index
    @timesheets = Timesheet.all

    render json: @timesheets
  end

  # GET /timesheets/1
  def show
    render json: @timesheet
  end

  # POST /timesheets
  def create
    # Check if any required parameters are missing
    errors = ValidateParameters.add_timesheet(params)

    unless errors.blank?
      render plain: errors.to_json and return
    end

    if current_user.blank?
      msg = {status: 401, message: "User not found"}
      render plain: msg.to_json and return
    end
    employee    = Employee.find_by_user_id(current_user.id)
    start_date  = params[:start_date]
    end_date    = params[:end_date]

    timesheet = Timesheet.create(
      employee_id:  employee.id,
      start_date:   start_date,
      end_date:     end_date,
    )

    if !timesheet.blank?
      render plain: timesheet.to_json
    else
      render plain: timesheet.errors.to_json
    end

  end

  # PATCH/PUT /timesheets/1
  def update
    if @timesheet.update(timesheet_params)
      render json: @timesheet
    else
      render json: @timesheet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timesheets/1
  def destroy
    @timesheet.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_timesheet
    @timesheet = Timesheet.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def timesheet_params
    params.fetch(:timesheet, {})
  end
end
