class ChangeUserIdNotNullInExperiences < ActiveRecord::Migration[7.1]
  def change
    change_column_null :experiences, :user_id, false
  end
end
