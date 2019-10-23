class CreateKeyWords < ActiveRecord::Migration[5.2]
  def change
    create_table :key_words do |t|
      t.text :word
      t.text :description
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
