class Artifact < ActiveRecord::Migration[5.2]
  def change
    create_table :artifacts do |t|
      t.references :exhibit, foreign_key: true
      t.string :name
      t.boolean :on_loan
      t.integer :year_created
      t.timestamps 
    end
  end
end
