class Round < ActiveRecord::Base
  attr_accessible :cutoff_at, :name, :starts_at
  
  has_many :matches
  
  # TODO: add logic to calculate when round is open
  def open
    true
  end
  
  # TODO: add logic to calculate current round 
  # Once results for previous round are calculated, the next round becomes the current round
  def self.current
    Round.find(1)
    # Round.find(3)
  end
  
  def teams
    self.matches.collect { |m| m.teams }.flatten
  end
end
# == Schema Information
#
# Table name: rounds
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  cutoff_at  :datetime
#  starts_at  :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

