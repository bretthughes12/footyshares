class Match < ActiveRecord::Base
  attr_accessible :allow_only_one_team, :name, :round_id, :venue, :completed
  
  belongs_to :round
  has_many :teams
end
# == Schema Information
#
# Table name: matches
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  venue               :string(255)
#  round_id            :integer(4)
#  allow_only_one_team :boolean(1)      default(FALSE), not null
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  completed           :boolean(1)      default(FALSE)
#

