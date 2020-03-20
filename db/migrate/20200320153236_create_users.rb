class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :user_name
      t.boolean :is_parent
      t.integer :total_points

      t.timestamps
    end
  end
end
