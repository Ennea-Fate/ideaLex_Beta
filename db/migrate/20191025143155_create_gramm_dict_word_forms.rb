class CreateGrammDictWordForms < ActiveRecord::Migration[5.2]
  def change
    create_table :gramm_dict_word_forms do |t|
      t.string :word
      t.text :chars
      t.integer :entries
      t.references :gramm_dict_word, foreign_key: true

      t.timestamps
    end
  end
end
