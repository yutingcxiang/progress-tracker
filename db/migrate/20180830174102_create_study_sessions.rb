class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table :study_sessions do |t|
      t.string :date
      t.decimal :hours
      t.string :summary
      t.integer :student_id
    end
  end
end
