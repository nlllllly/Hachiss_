class CustomersController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_customer, only: [:show]

    # マイページ
    def show
    end

    # 退会確認ページ
    def unsubscribe
    end

    # 退会ページ
    def withdraw
    end




    private
    def set_customer
        @customer = current_customer
    end
end
