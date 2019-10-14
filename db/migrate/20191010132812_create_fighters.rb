class CreateFighters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :lifepoints
      t.integer :hitpoints
      t.integer :experience, default: 0

      t.timestamps
    end
  end
end
