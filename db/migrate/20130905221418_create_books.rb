class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :isbn, precision: 8
      t.string :publisher
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
