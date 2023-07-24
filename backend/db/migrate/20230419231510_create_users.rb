class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :remember_digest
      t.string   :password_digest
      t.boolean  :activated,  default: false
      t.integer  :failed_logins, default: 0
      t.string   :token
      t.datetime :token_date
      t.string   :swipe_customer_id
      t.timestamps
    end
  end
end
