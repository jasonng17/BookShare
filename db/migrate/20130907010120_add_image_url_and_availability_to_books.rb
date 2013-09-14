class AddImageUrlAndAvailabilityToBooks < ActiveRecord::Migration
  def up
    add_column :books, :image_url, :string
    add_column :books, :availability, :string
  end

  def down
    remove_column :books, :image_url, :string
    remove_column :books, :availability, :string
  end

end
