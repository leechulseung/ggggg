class CreateQcoms < ActiveRecord::Migration
  def change
    create_table :qcoms do |t|
      t.string :content
      t.integer :qbb_id
      t.timestamps null: false
    end
  end
end
