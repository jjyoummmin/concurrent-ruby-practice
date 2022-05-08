# == Schema Information
#
# Table name: spending_details
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  account_book_id :bigint
#  type            :string(255)
#  description     :string(255)
#  price           :integer
#  date            :datetime
#
require "test_helper"

class SpendingDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
