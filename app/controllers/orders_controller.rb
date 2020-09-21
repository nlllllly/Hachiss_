class OrdersController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_order, only: [:show]
    before_action :set_customer, only: [:new, :create, :confirm]
    before_action :ensure_correct_order, only: [:show]

    def index
        @orders = Order.where(customer_id: current_customer.id).page(params[:page]).per(10).reverse_order
    end
    
    def show
    end

    def new
        @order = Order.new
    end
    
    def create
        if @customer.cart_items.exists?
            @order = Order.new(order_params)
            @order.customer_id = @customer.id
        
            # 住所のラジオボタン選択に応じて引数を調整
            @add = params[:order][:add].to_i
            case @add
                when 1
                    @order.postcode = @customer.postcode
                    @order.address = @customer.customer_full_address
                    @order.reciver_name = @customer.full_name
                when 2
                    @order.postcode = params[:order][:postcode]
                    @order.address = params[:order][:address_street]
                    @order.reciver_name = params[:order][:name]
            end
            
            # @orderをセーブ
            @order.save

            # cart_itemsの内容をorder_detailsに新規登録
            @customer.cart_items.each do |cart_item|
                order_detail = @order.order_details.build
                order_detail.order_id = @order.id
                order_detail.product_id = cart_item.product_id
                order_detail.quantity = cart_item.quantity
                order_detail.price = cart_item.product.price
                order_detail.save
                cart_item.destroy #order_detailに情報を移したらcart_itemは消去
            end

            render :thanks, notice: "購入手続きが完了しました！"

        else

            redirect_to cart_items_path, alert: "カートが空です"

        end
    end

    def confirm
        @order = Order.new
        @cart_items = @customer.cart_items
        @order.payment_method = params[:order][:payment_method]
        # 住所のラジオボタン選択に応じて引数を調整
        @add = params[:order][:add].to_i
        case @add
            when 1
                @order.postcode = @customer.postcode
                @order.address = @customer.customer_full_address
                @order.reciver_name = @customer.full_name
            when 2
                @sta = params[:order][:address].to_i
                @shipping_address = Shipping.find(@sta)
                @order.postcode = @shipping_address.postcode
                @order.address = @shipping_address.shipping_full_address
                @order.reciver_name = @shipping_address.full_name
        end
    end

    def thanks
    end



    private
    def order_params
        params.require(:order).permit(
          :customer_id,
          :postcode,
          :address,
          :reciver_name,
          :total_price,
          :payment_method,
          order_details_attributes:[:product_id, :order_id, :quantity, :price]
        )
    end
  
    def set_order
        @order = Order.find(params[:id])
    end
    
    def set_customer
        @customer = current_customer
    end
    
    def ensure_correct_order
        unless @order.customer_id == current_customer.id
            redirect_to orders_path, alert: "アクセスエラーです"
        end
    end

end
