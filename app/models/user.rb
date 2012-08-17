class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :nickname, :shares_remaining, :login, :starting_shares
end
