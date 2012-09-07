class Team < ActiveRecord::Base
  attr_accessible :match_id, :name, :winner
  
  belongs_to :match
  has_many :shares
  
  scope :winners, where(winner: true)
  
  def total_shares
    shares.sum(&:shares)
  end
end
# == Schema Information
#
# Table name: teams
#
#  id         :integer(4)      not null, primary key
#  match_id   :integer(4)
#  name       :string(255)     not null
#  winner     :boolean(1)      default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

