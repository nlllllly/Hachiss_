class ProductsController < ApplicationController
    
    before_action :set_product, only: [:show]

    def index
        # 販売停止中以外を表示する
        @products = Product.where.not(sale_status: 0).page(params[:page]).per(20)
    end
    
    def show
        # @products = Product.where(producer_id: @product.producer_id).order("RAND()").limit(4)
        # @products = Product.all

    end

    def search
        # @search_products = Product.all.page(params[:page]).search(params[:search])
    end


    private
    def set_product
        @product = Product.find(params[:id])
    end

end
