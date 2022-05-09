class AccountBookController < ApplicationController
    def create_sync
        month = Date.today.strftime("%Y-%m")
        fail = []

        start = Time.now
        User.all.each do |user|
            monthly_calculate(month, user)
        rescue
            fail << user.id
        end

        render json: {result: 'ok', fail: fail, took: "#{Time.now - start}sec"}
    end

    # TODO: raise error
    def create_parallel
        # backpressure 적용
        channel              = Concurrent::Promises::Channel.new 6
        cancellation, origin = Concurrent::Cancellation.new


        fail = []
        month = Date.today.strftime("%Y-%m")
        futures = User.all.map do |user|
            Concurrent::Promises.future { monthly_calculate(month, user) }.rescue { fail << user.id }
        end
        tasks.map(&:wait!) 


        
    end

    private

    def f
        pool = Concurrent::FixedThreadPool.new(3)
        pool.post do

            fail = []
            work = []
            start = Time.now

            tasks = [1,2,3,4,5,6,7].map do |x|
                Concurrent::Promises.future { work << x ; sleep 2; raise 'no' if x%2==0 }.rescue { fail << x }
            end
            tasks.map(&:wait!)

            p Time.now - start
            p fail
            p work
        end


    end
    
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