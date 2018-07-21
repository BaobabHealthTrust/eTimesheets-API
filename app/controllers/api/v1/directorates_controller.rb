class Api::V1::DirectoratesController < ApplicationController
  before_action :set_directorate, only: [:show, :update, :destroy]

  # GET /directorates
  def index
    @directorates = Directorate.all

    render json: @directorates
  end

  # GET /directorates/1
  def show
    render json: @directorate
  end

  # POST /directorates
  def create
    @directorate = Director.new(directorate_params)

    if @directorate.save
      render json: @directorate, status: :created, location: @directorate
    else
      render json: @directorate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /directorates/1
  def update
    if @directorate.update(directorate_params)
      render json: @directorate
    else
      render json: @directorate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /directorates/1
  def destroy
    @directorate.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_directorate
    @directorate = Director.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def directorate_params
    params.fetch(:directorate, {})
  end
end
