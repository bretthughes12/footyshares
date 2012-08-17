class Share < ActiveRecord::Base
  attr_accessible :shares, :team_id, :user_id
  
  belongs_to :user
  belongs_to :team
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

