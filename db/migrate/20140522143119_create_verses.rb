class CreateVerses < ActiveRecord::Migration
  def change
    create_table(:verses) do |t|
      t.string     :title,       null: false, default: "", unique: true
      t.text       :description, null: false, default: ""
      t.string     :label,       null: false, default: ""
      t.belongs_to :user,        index: true

      t.timestamps
    end
  end
end
