class Share < ActiveRecord::Base
  attr_accessible :shares, :team_id, :user_id
  
  belongs_to :user
  belongs_to :team

  validates :shares, presence: true, 
                     numericality: { only_integer: true }
  
  def self.prepare_for_user_and_round(user, round)
    if user && round
      teams = round.teams
    else
      teams = []
    end
    
    shares = []
    shares = teams.collect do |t|
      Share.find_or_create_by_user_id_and_team_id(user.id, t.id) do |s|
        s.user_id = user.id
        s.team_id = t.id
      end
    end
    shares
  end
  
  def self.store(user_id, team_id, shares)
    share = Share.find_by_user_id_and_team_id(user_id, team_id) || Share.new(user_id: user_id, team_id: team_id)
    
    share.shares = shares
    
    if share.save
      true
    else
      false
    end
  end
end
# == Schema Information
#
# Table name: shares
#
#  id         :integer(4)      not null, primary key
#  team_id    :integer(4)
#  user_id    :integer(4)
#  shares     :integer(4)      default(0)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

