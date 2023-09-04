class User < ApplicationRecord
  has_secure_password
  MAX_FAILED_LOGINS = 10
  # https://www.justinweiss.com/articles/a-lightweight-way-to-handle-different-validation-situations/

  validates :password,
    presence: true,
    format: {
      with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,60}/,
      message: I18n.t('user.password_validation')
    },
    on: :create
  
  validates :password,
    presence: true,
    format: {
      with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,60}/,
      message: I18n.t('user.password_validation')
    },
    on: :update,
    if: :password_digest_changed?

  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update, if: :password_digest_changed?

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }


  # user.authenticate_password("Qwertyui1!")

  #has_one: Role
  belongs_to :role

end
