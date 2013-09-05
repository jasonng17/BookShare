class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :school
      t.string :department
      t.integer :contact
      t.string :email

      t.timestamps
    end
  end
end
