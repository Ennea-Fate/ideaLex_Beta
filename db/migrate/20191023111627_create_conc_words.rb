class CreateConcWords < ActiveRecord::Migration[5.2]
  def change
    create_table :conc_words do |t|
      t.text :word
      t.text :concordance
      t.text :pages
      t.references :concordance, foreign_key: true

      t.timestamps
    end
  end
end
