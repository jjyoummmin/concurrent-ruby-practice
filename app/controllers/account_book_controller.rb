class AccountBookController < ApplicationController
    def create_sync
        month = Date.today.strftime("%Y-%m")
        fail = []
        User.all.each do |user|
            monthly_calculate(month, user)
        rescue
            fail << user.id
        end

        render json: {result: 'ok', fail: fail}
    end

    def create_parallel
    end

    private 

    def monthly_calculate(month, user)
        return if user.account_books.find_by(month: month).present?
        total_earning, 
        total_food, 
        total_shopping, 
        total_culture, 
        total_education = [:earning_details, :foods, :shoppings, :cultures, :educations].map { |x| user.send(x).this_month.pluck(:price).reduce(:+) || 0 }

        result = total_earning - (total_food + total_shopping + total_culture + total_education)
        total_result = result.to_s(:delimited)
        user.account_books.create(month: month,
                                  total_result: total_result,
                                  total_earning: total_earning,
                                  total_food: total_food,
                                  total_shopping: total_shopping,
                                  total_culture: total_culture,
                                  total_education: total_education)
    end
end