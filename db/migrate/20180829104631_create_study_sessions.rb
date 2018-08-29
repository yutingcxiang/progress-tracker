class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table study_sessions do |t|
      t.date :date
      t.string :section_name
      t.string :item
      t.decimal :hours
      t.integer :user_id
    end
  end
end
