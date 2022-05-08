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
class EarningDetail < ApplicationRecord
    belongs_to :user
    belongs_to :account_book, optional: true
end
