class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :conc_words, :concordance, :content
  end
end
