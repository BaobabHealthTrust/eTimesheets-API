class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :create]

  def login
    authenticate params[:email], params[:password]
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.roles << Role.find_by_name("standard")

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def verify_token
    token_status = HashWithIndifferentAccess.new(JWT.decode(params[:token],
                                                            Rails.application.secrets.secret_key_base)[0]) rescue []
    if token_status.blank?
      message = {status: 401, message: "Failed"}
    else
      message = {status: 200, message: "Successful"}
    end
    render plain: message.to_json
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      user = User.find_by_email(email)
      render json: {
               access_token: command.result,
               message: "Login Successful",
               user: user,
             }
    else
      render json: {error: command.errors}, status: :unauthorized
    end
  end
end
