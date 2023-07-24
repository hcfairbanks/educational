class ApplicationController < ActionController::API
  include JwtToken


  # https://www.freshworks.com/saas/eng-blogs/how-to-perform-dynamic-jwt-authentication-and-secrets-rotation-in-rails-applications-blog/
  # https://medium.com/binar-academy/rails-api-jwt-authentication-a04503ea3248
  # https://stackoverflow.com/questions/37799296/ruby-what-does-the-comment-frozen-string-literal-true-do

  puts JwtToken::FUCK
  puts JwtToken.jwt_encode({exp: 1})
  debugger


  SECRET_KEY = Rails.application.secret_key_base
  token = JWT.encode("hello", SECRET_KEY)
  puts "xxxxxxxxxxxxxxxxxxxxxxxxxxx  "+ token
  payload = JWT.decode(token, SECRET_KEY)
  puts "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLL " + payload.to_s

  # helper JsonWebToken

  # token = jwt_encode("hello")
  # puts "xxxxxxxxxxx" + token
  # x = jwt_decode(token)
  # puts x

end
