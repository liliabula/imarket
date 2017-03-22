class AddAttachmentCoverToMentors < ActiveRecord::Migration
  def self.up
    change_table :mentors do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :mentors, :cover
  end
end
