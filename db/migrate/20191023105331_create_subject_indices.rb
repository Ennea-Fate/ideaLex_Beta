class CreateSubjectIndices < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_indices do |t|
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
