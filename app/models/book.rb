class Book < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  scope :recent, proc {order("created_at desc")}  #Display in order of the newest book

  # SQL LIKE condition allows you to use wildcards
  # % allows you to match any string of any length (including zero length)

  def self.search(search)
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  end


end
