class Match < ActiveRecord::Base
  attr_accessible :allow_only_one_team, :name, :round_id, :venue, :completed
end
