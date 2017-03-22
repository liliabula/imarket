class AddUserIdToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :user_id, :interger
  end
end
