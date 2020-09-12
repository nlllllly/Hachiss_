class CustomersController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_customer, only: [:show, :unsubscribe, :withdraw]

    # マイページ（my_page）
    def show
    end

    # 退会確認ページ
    def unsubscribe
    end

    # 退会ページ
    def withdraw
        @customer.update(is_deleted: true)
		reset_session
		redirect_to root_path, notice: "退会手続きが完了しました。ご利用ありがとうございました。"
    end




    private
    def set_customer
        @customer = current_customer
    end

end
