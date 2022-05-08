# == Schema Information
#
# Table name: earning_details
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  account_book_id :bigint
#  description     :string(255)
#  price           :integer
#  date            :datetime
#
require "test_helper"

class EarningDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
