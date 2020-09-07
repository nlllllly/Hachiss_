class ProductsController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_product, only: [:show]

    def index
        @products = Product.page(params[:page]).per(20)
    end

    def show
    end

    def search
    end


    private
    def set_product
        @product = Product.find(params[:id])
    end

end
