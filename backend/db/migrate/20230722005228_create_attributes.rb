class CreateAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :attributes do |t|
      t.string :model
      t.string :action
      t.boolean :value
      t.timestamps
    end
  end
end
