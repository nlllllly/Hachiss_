class ShippingsController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_shipping, only: [:edit, :update, :destroy]

    def index
        @shippings = Shipping.page(params[:page]).per(20)
        @shipping = Shipping.new
    end

    def create
        @shipping = Shipping.new(shipping_params)
        if @shipping.save
            redirect_to shippings_path
        else
            render :index, alert: "保存できませんでした"
        end
    end

    def edit
    end

    def update
        if @shipping.update(shipping_params)
            redirect_to shippings_path
        else
            render :edit, alert: "保存できませんでした"
        end
    end

    def destroy
    end
    


    private
    def shipping_params
        params.require(:shipping).permit(
            :last_name_kana,
            :first_name_kana,
            :last_name, :first_name,
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



end
