class Artifact < ActiveRecord::Migration[5.2]
  def change
    create_table :artifacts do |t|
      t.references :exhibit, foreign_key: true
      t.string :name
      t.string :material
      t.string :year_created
      t.integer :total_pieces
      t.boolean :on_loan
      
      t.timestamps 
    end
  end
end
