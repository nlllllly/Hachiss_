class Admins::CustomersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_customer, only: [:show, :update]

    def index
        @customers = Customer.page(params[:page]).per(15)
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
