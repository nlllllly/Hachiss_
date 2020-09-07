class Admins::OrdersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_order, only: [:show, :update]

    def index
        @orders = Order.page(params[:page]).per(20)
    end

    def show
    end

    def update
    end



    private
    def set_order
        @order = Order.find(params[:id])
    end
end
