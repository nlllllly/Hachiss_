class Admins::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_order_detail, only: [:update]

    def update
    end




    private
    def set_order_detail
        @order_detail = OrderDetail.find(params[:id])
    end
end
