class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :email_user
      t.string :email_mentor
      t.string :guid
      t.integer :mentor_id

      t.timestamps null: false
    end
  end
end
