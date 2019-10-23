class CreateFrequencyVocabularies < ActiveRecord::Migration[5.2]
  def change
    create_table :frequency_vocabularies do |t|
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
