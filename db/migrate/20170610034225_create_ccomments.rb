class CreateCcomments < ActiveRecord::Migration
  def change
    create_table :ccomments do |t|
      t.string :content
      t.integer :cbb_id
      t.timestamps null: false
    end
  end
end
