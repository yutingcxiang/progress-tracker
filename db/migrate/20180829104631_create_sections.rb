class CreateSections < ActiveRecord::Migration
  def change
    create_table sections do |t|
      t.string :name
      t.string :item
      t.decimal :hours
      t.integer :user_id
    end
  end
end
