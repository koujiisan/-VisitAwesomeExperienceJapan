class RemoveNullExperiences < ActiveRecord::Migration[7.1]
  def change
    Experience.where(user_id: nil).delete_all
  end
end
