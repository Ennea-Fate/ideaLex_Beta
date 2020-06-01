class AddEntriesToGrammDictWords < ActiveRecord::Migration[5.2]
  def change
    add_column :gramm_dict_words, :entries, :integer
  end
end
