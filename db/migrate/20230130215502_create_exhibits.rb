class CreateExhibits < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibits do |t|
      # Line above is saying: create a string column in the table named :name

      t.string :name
      t.boolean :on_display
      t.float :price

      t.timestamps 
      # Line above creates the following two in the schema.rb file: 
        # t.datetime :created_at
        # t.datetime :updated_at
    end
  end
end
