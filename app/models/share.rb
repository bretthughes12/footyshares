class Share < ActiveRecord::Base
  attr_accessible :shares, :team_id, :user_id
end
