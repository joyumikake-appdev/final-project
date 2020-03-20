class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.date :day
      t.integer :english
      t.integer :japanese
      t.integer :math
      t.integer :science
      t.integer :social_study
      t.integer :other_study
      t.integer :game
      t.text :diary
      t.integer :point

      t.timestamps
    end
  end
end
