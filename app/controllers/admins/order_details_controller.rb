class Admins::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_order_detail, only: [:update]

    def update
        if @order_detail.update(order_detail_params)
            # 商品ステータスが全て「2(準備完了)」になったら注文ステータスも「2(発送準備中)」にする。
            if @order_detail.order.order_details.all?{|order_detail| order_detail.product_status == "ready"}
                @order = Order.find(@order_detail.order_id)
                @order.update(order_status: "preparing")
                @order_detail.update(order_detail_params)
                redirect_to request.referer, notice: "商品ステータスを更新しました"
            else
                @order_detail.update(order_detail_params)
                redirect_to request.referer, notice: "商品ステータスを更新しました"
            end
        else
            @order = Order.find(params[:id])
            @customer = @order.customer_id
            @order_details = OrderDetail.where(order_id: @order.id)
            render 'admins/orders/show', alert: "更新できませんでした"
        end
    end




    private
    def order_detail_params
        params.require(:order_detail).permit(:product_status)
    end

    def set_order_detail
        @order_detail = OrderDetail.find(params[:id])
    end
end
