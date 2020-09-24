class Admins::CustomersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_customer, only: [:show, :update]

    def index
        # もし、検索ワードがあれば、検索結果を表示 / なければ通常の表示
        @keyword = params[:keyword]
        if @keyword.present?
            @customers = Customer.where('last_name LIKE(?) or first_name LIKE(?)', "%#{@keyword}%", "%#{@keyword}%").page(params[:page]).per(16)
        else
            @customers = Customer.page(params[:page]).per(15)
        end
    end

    def show
    end

    def update
        if @customer.update(customer_params)
            redirect_to admins_customer_path(@customer), notice: "変更を保存しました"
        else
            render :show, alert: "変更を保存できませんでした"
        end
    end



    private
    def customer_params
        params.require(:customer).permit(:is_deleted)
    end

    def set_customer
        @customer = Customer.find(params[:id])
    end

end
