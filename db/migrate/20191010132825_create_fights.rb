class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.belongs_to :loser
      t.belongs_to :winner
      
      t.timestamps
    end
  end
end
