class RemoveStringFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :string, :string
  end

end
