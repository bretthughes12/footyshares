class Team < ApplicationRecord
  belongs_to :match
  has_many :shares
  
  scope :winners, -> { where(winner: true) }
  
  validates :name,            length: { maximum: 255 }

  def total_shares
    shares.sum(:shares)
  end
  
  def share_percentage
    (total_shares * 100).to_f / match.round.starting_shares
  end
end

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  match_id   :integer
#  name       :string(255)      not null
#  winner     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
