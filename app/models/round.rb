class Round < ActiveRecord::Base
  attr_accessible :cutoff_at, :name, :starts_at, :prev_round_id
  
  has_many :matches
  has_one :previous, class_name: 'Round', foreign_key: 'prev_round_id'
  
  def open
    cutoff_at > Time.now
  end
  
  # Once results for previous round are calculated, the next round becomes the current round
  def self.current
    Round.where('starts_at < now()').order('starts_at DESC').first
  end
  
  def teams
    self.matches.collect { |m| m.teams }.flatten
  end
  
  def starting_shares
    if self.prev_round_id.nil?
      User.total_shares_invested
    else
      r = Round.find(prev_round_id)
      r.shares_remaining
    end
  end
end
# == Schema Information
#
# Table name: rounds
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  cutoff_at        :datetime
#  starts_at        :datetime
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  shares_remaining :integer(4)      default(0)
#  prev_round_id    :integer(4)      default(0)
#

