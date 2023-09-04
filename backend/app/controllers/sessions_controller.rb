class SessionsController < ApplicationController
  #include JwtToken
  #include
  
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
    user = User.find_by(email: params[:email].downcase)
    token = ""
    message = "User failed to login"

    if user && user.authenticate(params[:password]) && user.activated && user.failed_logins < User::MAX_FAILED_LOGINS
      token = JwtToken.jwt_encode({user_id: user.id})
      message = SessionsConcern.log_in(user)
      message = "User login success"
      # SessionsConcern.remember(user)
    elsif user.present? && user.activated
      # failed_login(user)
      # message = failed_login_message(user)
    end
    render json: { jwt: token, message: message }
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
