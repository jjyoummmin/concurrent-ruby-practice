# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :account_books
    has_many :earning_details
    has_many :foods
    has_many :shoppings
    has_many :cultures
    has_many :educations
end
