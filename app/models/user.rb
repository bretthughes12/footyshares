class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :nickname, :shares_remaining, 
                  :login, :starting_shares

  has_many :shares
  
  validates :login,           presence: true, 
                              uniqueness: true,
                              length: { maximum: 255 }
  validates :email,           presence: true,
                              length: { maximum: 100 },
                              format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
                                        message: "invalid format" }
  validates :password,        confirmation: true
  validates :hashed_password, presence: { message: "Missing password" }

  attr_accessor   :password
  attr_protected  :admin, :id, :salt
  
  after_validation :accumulate_errors
  
  def self.authenticate(login, password)
    user = self.find_by_login(login)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
    
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "fiflinwoff" + salt  # 'fiflinwoff' makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def accumulate_errors
    self.errors[:base] << self.errors[:hashed_password]
  end
end
# == Schema Information
#
# Table name: users
#
#  id               :integer(4)      not null, primary key
#  login            :string(255)
#  name             :string(255)
#  hashed_password  :string(255)
#  salt             :string(255)
#  email            :string(255)
#  nickname         :string(255)
#  admin            :boolean(1)      default(FALSE)
#  shares_remaining :integer(4)      default(0)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  starting_shares  :integer(4)      default(0)
#

