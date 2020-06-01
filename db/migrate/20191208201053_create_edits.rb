class CreateEdits < ActiveRecord::Migration[5.2]
  def change
    create_table :edits do |t|
      t.text :edit
      t.references :unanimou, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
