class ShippingsController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_shipping, only: [:edit, :update, :destroy]
    before_action :ensure_correct_shipping, only: [:edit, :update, :destroy]

    def index
        @shippings = Shipping.page(params[:page]).per(10)
    end
    
    def new
        @shipping = Shipping.new
    end
    
    def create
        @customer = current_customer
        @shipping = Shipping.new(shipping_params)
        @shipping.customer_id = @customer.id
        if @shipping.save
            redirect_to shippings_path, notice: "登録が完了しました"
        else
            redirect_to new_shipping_path, alert: "登録できませんでした"
        end
    end

    def edit
    end

    def update
        if @shipping.update(shipping_params)
            redirect_to shippings_path, notice: "変更を保存しました"
        else
            redirect_to edit_shipping_path, alert: "変更を保存できませんでした"
        end
    end
    
    def destroy
        if @shipping.destroy
            redirect_to shippings_path, notice: "削除が完了しました"
        else
            render :index, alert: "削除できませんでした"
        end
    end
    


    private
    def shipping_params
        params.require(:shipping).permit(
            :customer_id,
            :last_name_kana,
            :first_name_kana,
            :last_name,
            :first_name,
            :postcode,
            :prefecture_code,
            :prefecture_name,
            :address_city,
            :address_street,
            :address_building
            )
        end


    def set_shipping
        @shipping = Shipping.find(params[:id])
    end

    def ensure_correct_shipping
        unless @shipping.customer_id == current_customer.id
            redirect_to shippings_path, alert: "アクセスエラーです"
        end
    end


end
