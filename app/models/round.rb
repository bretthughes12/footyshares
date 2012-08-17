class Round < ActiveRecord::Base
  attr_accessible :cutoff_at, :name, :starts_at
  
  has_many :matches
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

