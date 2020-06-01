class CreateUnanimous < ActiveRecord::Migration[5.2]
  def change
    create_table :unanimous do |t|
      t.string :word
      t.string :pos
      t.text :chars
      t.text :desc
      t.boolean :approves
      t.references :author, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
