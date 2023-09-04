class ApplicationController < ActionController::API
  # before_action :set_locale
  include Pundit
  # protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # include SessionsConcern
  # debugger
  # puts params
  # SessionsConcern.current_user_2
  # https://www.freshworks.com/saas/eng-blogs/how-to-perform-dynamic-jwt-authentication-and-secrets-rotation-in-rails-applications-blog/
  # https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248
  # https://stackoverflow.com/questions/37799296/ruby-what-does-the-comment-frozen-string-literal-true-do


  # def pundit_user
  #   AuthorizationContext.new(current_user, current_office)
  # end
  before_action :user_token_authentication

  private

  def set_locale
    cookies[:locale] = params[:locale] if params[:locale]
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = cookies[:locale].blank? ? params[:locale] : cookies[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def user_not_authorized
    render json: {error: "Not Authorized"}.to_json, status: 401
    #redirect_to(request.referrer || "/")
  end

# PUNDIT
# https://crypt.codemancers.com/posts/2018-07-29-leveraging-pundit/

# Interesting 1:16
# https://www.youtube.com/watch?v=hlpKyOb5yLc&ab_channel=GoRails

  # https://ideabreed.net/blog/rails-api/2019/12/08/rails-api-with-jwt-authentication/
    def current_user
      header_token = request.headers[:HTTP_AUTHORIZATION]
      if header_token
        token = header_token.split(' ').last
        decoded = JwtToken.jwt_decode(token)
        # I will need to find out of the token has expired
        # I will need to set it to a User.new if there is no token
        begin
          #decoded = JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
          user = User.find(decoded["user_id"])
          user
        rescue JWT::ExpiredSignature
          render json: { error: 'Token has expired' }
        end
      else
        User.new #nil
      end
    end

    def user_token_authentication
      unless current_user
        # User.new
        render json: { error: 'Invalid token' }
      end
    end


end
