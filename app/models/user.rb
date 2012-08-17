class User < ActiveRecord::Base
  attr_accessible :admin, :email, :hashed_password, :name, :nickname, :salt, :shares_remaining, :login
end
