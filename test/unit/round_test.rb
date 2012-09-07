require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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

