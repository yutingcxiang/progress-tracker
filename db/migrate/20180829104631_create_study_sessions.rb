class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table :study_sessions do |t|
      t.date :date
      t.string :section_name
      t.decimal :hours
      t.integer :user_id
    end
  end
end
