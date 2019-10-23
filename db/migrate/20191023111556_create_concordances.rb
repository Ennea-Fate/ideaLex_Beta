class CreateConcordances < ActiveRecord::Migration[5.2]
  def change
    create_table :concordances do |t|
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
