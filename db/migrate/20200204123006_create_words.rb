class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name , null: false
      t.text :description

      t.timestamps
    end
  end
end