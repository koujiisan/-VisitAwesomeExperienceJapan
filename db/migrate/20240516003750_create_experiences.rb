class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :tag
      t.datetime :time
      t.string :cost
      t.string :image
      t.timestamps
    end

    add_index :experiences, :title
    add_index :experiences, :tag
    add_index :experiences, :time
  end
end
