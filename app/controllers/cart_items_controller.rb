class CartItemsController < ApplicationController
	before_action :authenticate_customer!
    before_action :set_cart_item, only: [:update, :destroy]

    def index
        @cart_items = current_customer.cart_items.all
    end

    def create
        @cart_item = current_customer.cart_items.build(cart_item_params)
        @current_item = CartItem.find_by(product_id: @cart_item.product_id, customer_id: current_customer.id)
        
        if @current_item.nil?
            if @cart_item.save
                redirect_to cart_items_path, notice: "カート内の商品が変更されました"
            else
                render :index, alert: "変更できませんでした"
            end
        else
            sum = @current_item.quantity.to_i + cart_item_params[:quantity].to_i
            if @current_item.update(quantity: sum)
                redirect_to cart_items_path, notice: "カート内の商品の数量が変更されました"
            else
                render :index, alert: "変更できませんでした"
            end
        end
    end
    
    def update
        if @cart_item.update(cart_item_params)
            redirect_to request.referer, notice: "カート内の商品が変更されました"
        else
            render :index, alert: "変更できませんでした"
        end
    end
    
    def destroy
        if @cart_item.destroy
            redirect_to request.referer, notice: "カート内の商品が削除されました"
        else
            render :index, alert: "削除できませんでした"
        end
    end

    def destroy_all
        if current_customer.cart_items.destroy_all
            redirect_to request.referer, notice: "カート内の全ての商品が削除されました"
        else
            render :index, alert: "削除できませんでした"
        end
    end


    private
    def cart_item_params
        params.require(:cart_item).permit(:product_id, :quantity)
    end

    def set_cart_item
        @cart_item = CartItem.find(params[:id])
    end

end
