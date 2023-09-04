module SessionsConcern

  # Logs in the given user.
  def self.log_in(user)
    user.failed_logins = 0
    user.save(context: :create_session)
    message = "User login success"
  end

  def failed_login(user)
    user.failed_logins += 1
    user.save(context: :failed_create_session)
  end

  # def authenticate_login(user)
  #   user.authenticate(params[:session][:password]) && user.active && user.failed_logins < User::MAX_FAILED_LOGINS
  # end

  def failed_login_message(user)
    if user.failed_logins >= 6 && user.failed_logins < User::MAX_FAILED_LOGINS
      message = "#{User::MAX_FAILED_LOGINS - user.failed_logins }" + t("login.attempts_left")

    elsif user.failed_logins >= User::MAX_FAILED_LOGINS
      message = t("login.locked_out")
    else
      message = t("login.invalid_combo")
    end
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id].present?
       @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id].present?
      # This allows the user to close the browser but be logged in when a new browser opens
      user = User.find_by(id: cookies.signed[:user_id])
      #TODO this needs to bechanged, as it stands no user will be assigned if this fails, not even a temperary one
      # this may cause an error somewhere without something like => else @current_user = User.new
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    else
      @current_user = User.new
    end
     # if (user_id == session[:user_id])
     #   @current_user ||= User.find_by(id: user_id)
     # elsif (user_id == cookies.signed[:user_id])
     #   user = User.find_by(id: user_id)
     #   if user && user.authenticated?(cookies[:remember_token])
     #     log_in user
     #     @current_user = user
     #   end
     # elsif
     #  @current_user = User.new
     # end
     #

   end


  def self.current_user_2
    #token = JwtToken.jwt_decode({id: user.id})
    debugger
    x = 1+1
    x + 2
  end

  def current_brand
    "brand_a"
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    # This was done for the sake of development, db recreating and browser cookies caused issues
    current_user.present? and !current_user.id.nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def self.remember(user)
    user.remember
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end