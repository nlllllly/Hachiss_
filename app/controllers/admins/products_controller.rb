class Admins::ProductsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_product, only: [:show ,:edit, :update, :destroy]

    def index
        @products = Product.page(params[:page]).per(30)
    end

    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admins_product_path(@product)
        else
            render :new , alert: "保存できませんでした"
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @product.update(product_params)
            redirect_to admins_product_path(@product)
        else
            render :edit, alert: "保存できませんでした"
        end
    end

    def destroy
        if @product.destroy
            redirect_to admins_products_path
        else
            render :show, alert: "削除できませんでした"
        end
    end
    

    private
    def product_params
        params.require(:product).permit(:name, :image, :price, :genre_id, :description, :producer_id, :sale_status)
    end
    
    def set_product
        @product = Product.find(params[:id])
    end

end
