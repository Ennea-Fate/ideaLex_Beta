class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :text
      t.text :name
      t.date :publ_date

      t.timestamps
    end
  end
end
