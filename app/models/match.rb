class Match < ApplicationRecord
  belongs_to :round
  has_many :teams

  validates :name,            length: { maximum: 255 }
  validates :venue,           length: { maximum: 255 }
end

# == Schema Information
#
# Table name: matches
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  venue               :string(255)
#  round_id            :integer
#  allow_only_one_team :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
