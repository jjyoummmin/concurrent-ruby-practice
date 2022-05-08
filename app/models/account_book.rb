# == Schema Information
#
# Table name: account_books
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  month           :string(255)
#  total_result    :string(255)
#  total_earning   :integer
#  total_food      :integer
#  total_shopping  :integer
#  total_culture   :integer
#  total_education :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class AccountBook < ApplicationRecord
    has_many :earning_details
    has_many :foods
    has_many :shoppings
    has_many :cultures
    has_many :educations
end
