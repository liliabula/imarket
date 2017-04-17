class CreateFriendlyIdids < ActiveRecord::Migration
  def change
    create_table :friendly_id_ids do |t|
      t.string   :id,           :null => false
      t.integer  :idgable_id,   :null => false
      t.string   :idgable_type, :limit => 50
      t.string   :scope
      t.datetime :created_at
    end
    add_index :friendly_id_ids, :idgable_id
    add_index :friendly_id_ids, [:id, :idgable_type]
    add_index :friendly_id_ids, [:id, :idgable_type, :scope], :unique => true
    add_index :friendly_id_ids, :idgable_type
  end
end
