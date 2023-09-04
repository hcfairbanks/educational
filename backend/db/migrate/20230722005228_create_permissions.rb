class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.string :model
      t.string :action
      t.timestamps
    end
  end
end
