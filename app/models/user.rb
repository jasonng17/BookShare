class User < ActiveRecord::Base
  has_many :books, dependent: :destroy
  before_save {self.email = email.downcase}

  #validates :password, presence: true, :on => :create
  validates :email, presence: true, :on => :create
  validates :email, uniqueness: {:case_sensitive => false}

  has_secure_password



end
