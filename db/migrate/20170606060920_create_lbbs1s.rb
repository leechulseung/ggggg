class CreateLbbs1s < ActiveRecord::Migration
  def change
    create_table :lbbs1s do |t|
      t.string :class_code
      t.string :title
      t.string :name
      t.integer :gp

      t.timestamps null: false
    end
  end
end
