class User < ApplicationRecord
  has_secure_password
  # https://www.justinweiss.com/articles/a-lightweight-way-to-handle-different-validation-situations/
  # validates_presence_of :password, on: :update

  PASSWORD_VALIDATION_MESSAGE="Minimum 8 and maximum 60 characters, at least one uppercase letter, one lowercase letter, one number and one special character:"

  validates :password,
    presence: true,
    format: {with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,60}/,
    message: PASSWORD_VALIDATION_MESSAGE},
    on: :create
  
  validates :password,
    presence: true,
    format: {with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,60}/,
    message: PASSWORD_VALIDATION_MESSAGE},
    on: :update,
    if: :password_digest_changed?

  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update, if: :password_digest_changed?

  # user.authenticate_password("Qwertyui1!")

end
