class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table :study_sessions do |t|
      t.date :date
      t.decimal :hours
      t.string :summary
      t.integer :user_id
    end
  end
end
