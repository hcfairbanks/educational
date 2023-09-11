class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :account_type_id
      t.boolean :active
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :status

      t.timestamps
    end
  end
end
