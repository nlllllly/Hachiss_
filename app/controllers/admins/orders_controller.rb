class Admins::OrdersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_order, only: [:show, :update]

    def index
        @orders = Order.page(params[:page]).per(15)
    end

    def show
        @customer = @order.customer_id
    end

    def update
        if @order.update(order_params)
            # 注文ステータスが「3（発送済み）」にしたら、商品ステータスを「2（準備完了）」にする
            if @order.order_status == "shipped"
                @order.order_details.update(product_status: "ready")
                redirect_to request.referer, notice: "注文ステータスを更新しました"
            else
                redirect_to request.referer, notice: "注文ステータスを更新しました"
            end
        else
            @customer = @order.customer_id
            @order_details = OrderDetail.where(order_id: @order.id)
            render :show, alert: "更新できませんでした"
        end
    end



    private
    def order_params
        params.require(:order).permit(:order_status)
    end

    def set_order
        @order = Order.find(params[:id])
    end
end
