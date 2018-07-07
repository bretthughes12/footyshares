class User < ApplicationRecord
  include Comparable

  has_many :shares
  
  validates :login,           presence: true, 
                              uniqueness: true,
                              length: { maximum: 255 }
  validates :name,            presence: true, 
                              uniqueness: true,
                              length: { maximum: 255 }
  validates :nickname,        uniqueness: true, 
                              allow_blank: true,
                              length: { maximum: 255 }
  validates :email,           presence: true,
                              length: { maximum: 100 },
                              format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
                                        message: "invalid format" }
  validates :password,        confirmation: true
  validates :starting_shares, presence: true, 
                              numericality: { greater_than_or_equal_to: 50,
                                              only_integer: true }

  attr_accessor   :password
  
  before_validation :check_password_provided
  before_validation :validate_shares_in_lots_of_50
  before_validation :downcase_login_field
  
  before_create :initialize_shares_remaining
  
  STARTING_SHARE_PRICE_IN_CENTS = 10
  
  def <=>(other)
    self.display_name <=> other.display_name
  end
  
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
  
  def display_name
    nickname.blank? ? name : nickname
  end
  
  def amount_payable_in_dollars
    self.starting_shares * STARTING_SHARE_PRICE_IN_CENTS / 100
  end
  
  def self.current_shareprice
    if total_shares_remaining > 0 
      (total_shares_invested * STARTING_SHARE_PRICE_IN_CENTS).to_f / total_shares_remaining
    else
      0
    end
  end
  
  def self.total_shares_invested
    User.sum(:starting_shares)
  end
  
  def self.total_shares_remaining
    User.sum(:shares_remaining)
  end
  
  def self.reset_shares_remaining
    User.update_all(shares_remaining: 0)
  end
  
  def self.update_shares_remaining
    Round.current.matches.each do |match|
      match.teams.winners.each do |team|
        team.shares.each do |share|
          user = share.user
          user.shares_remaining += share.shares
          user.save
        end
      end
    end
  end
  
  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "fiflinwoff" + salt  # 'fiflinwoff' makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def check_password_provided
    errors[:password] << "Missing password" if hashed_password.blank?
  end
  
  def validate_shares_in_lots_of_50
    errors[:starting_shares] << "Shares must be purchsed in lots of 50" if starting_shares % 50 != 0
  end
  
  def initialize_shares_remaining
    self.shares_remaining = self.starting_shares 
  end
  
  def downcase_login_field
    self.login = self.login.downcase
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
#  paid             :boolean(1)      default(FALSE)
#

