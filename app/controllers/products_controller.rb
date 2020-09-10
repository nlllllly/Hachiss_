class ProductsController < ApplicationController
    
    before_action :set_product, only: [:show]
    before_action :set_sidebar, only: [:index, :show, :search]

    def index
        # 販売停止中以外の商品を表示する
        @products = Product.where.not(sale_status: 0).page(params[:page]).per(20)
    end
    
    def show
        # 販売停止中以外の商品で、生産者のidが紐づくものだけをランダムに6つ表示する
        @products = Product.where.not(sale_status: 0).where(producer_id: @product.producer_id).order("RANDOM()").limit(6)
    end

    def search
        search = params[:search]
        if search.present?
            @search_products = Product.page(params[:page]).per(20).where('name LIKE ?', "%#{search}%")
        else
            @search_products = Product.none
        end
    end
    
    
    private
    def set_product
        @product = Product.find(params[:id])
    end
    
    def set_sidebar
        # ステータスが有効のジャンルを表示する
        @genres = Genre.where(genre_status: 1).all
        # ステータスが無効ではない生産者を表示する
        @producers = Producer.where.not(producer_status: 0).all
    end

end
