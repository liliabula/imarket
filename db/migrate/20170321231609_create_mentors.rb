class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :profession
      t.string :location
      t.decimal :price
      t.text :description
      t.text :industries
      t.text :expertise

      t.timestamps null: false
    end
  end
end
