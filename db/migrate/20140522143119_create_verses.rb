class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.string :title
      t.text :description, limit: 120
      t.string :label

      t.timestamps
    end
  end
end
