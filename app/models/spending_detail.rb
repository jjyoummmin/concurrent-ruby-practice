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
class SpendingDetail < ApplicationRecord
    belongs_to :user
    belongs_to :account_book, optional: true

    scope :this_month, -> { where('date >= ? and date <= ?', Date.today.beginning_of_month, Date.today.end_of_month) }
end
