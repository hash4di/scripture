class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.integer :book
      t.integer :chapter
      t.integer :line
      t.text :body

      t.timestamps
    end
  end
end
