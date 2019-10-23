class CreateFreqVocWords < ActiveRecord::Migration[5.2]
  def change
    create_table :freq_voc_words do |t|
      t.text :word
      t.integer :occurrence_rate
      t.references :frequency_vocabulary, foreign_key: true

      t.timestamps
    end
  end
end
