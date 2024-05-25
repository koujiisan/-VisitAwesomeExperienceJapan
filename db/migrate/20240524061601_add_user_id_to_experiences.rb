class AddUserIdToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :user_id, :bigint
    add_index :experiences, :user_id
  end
end
