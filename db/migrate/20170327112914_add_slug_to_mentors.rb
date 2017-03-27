class AddSlugToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :slug, :string
    add_index :mentors, :slug, unique: true
  end
end
