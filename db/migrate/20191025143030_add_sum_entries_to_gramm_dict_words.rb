class AddSumEntriesToGrammDictWords < ActiveRecord::Migration[5.2]
  def change
    add_column :gramm_dict_words, :sum_entries, :integer
  end
end
