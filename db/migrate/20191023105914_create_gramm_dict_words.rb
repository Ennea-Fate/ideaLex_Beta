class CreateGrammDictWords < ActiveRecord::Migration[5.2]
  def change
    create_table :gramm_dict_words do |t|
      t.text :word
      t.text :chars
      t.references :grammar_dictionary, foreign_key: true

      t.timestamps
    end
  end
end
