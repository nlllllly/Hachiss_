class Admins::CustomersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_customer, only: [:edit, :update]

    def index
        @customers = Customer.page(params[:page]).per(20)
    end

    def show
    end

    def edit
    end

    def update
        if @customer.update
            redirect_to admins_customer_path(@customer)
        else
            render :edit, alert: "保存されませんでした"
        end
    end

    private


    def set_customer
        @customer = Customer.find(params[:id])
    end

end
