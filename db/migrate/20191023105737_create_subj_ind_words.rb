class CreateSubjIndWords < ActiveRecord::Migration[5.2]
  def change
    create_table :subj_ind_words do |t|
      t.text :word
      t.text :pages
      t.references :subject_index, foreign_key: true

      t.timestamps
    end
  end
end
