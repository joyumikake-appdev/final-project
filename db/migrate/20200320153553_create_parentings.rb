class CreateParentings < ActiveRecord::Migration[6.0]
  def change
    create_table :parentings do |t|
      t.integer :kid_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
