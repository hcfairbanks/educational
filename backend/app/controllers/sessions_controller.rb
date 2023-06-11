class SessionsController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /sessions
  def index
    @users = User.all

   #render json: {"hello": "world"}
   render json: @users
  end

  # GET /sessions/1
  def show
    render json: @user
  end

  # POST /sessions
  def create
    # @user = User.new(user_params)

    # if @user.save
    #   render json: @user, status: :created, location: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
    render json: { session_id: 123455678, first_name: "bob" }
  end

  # PATCH/PUT /sessions/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
