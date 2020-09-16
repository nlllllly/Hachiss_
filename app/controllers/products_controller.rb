class ProductsController < ApplicationController

    before_action :set_product, only: [:show]
    before_action :set_sidebar, only: [:index, :show, :search]

    def index
        # 販売停止中以外の商品を表示する
        @products = Product.where.not(sale_status: 0).page(params[:page]).per(20)
    end
    
    def show
        @cart_item = CartItem.new
        @product_comment = ProductComment.new
        # 販売停止中以外の商品で、生産者のidが紐づくものだけをランダムに6つ表示する
        @products = Product.where.not(sale_status: 0).where(producer_id: @product.producer_id).order("RANDOM()").limit(6)
        # 本番環境では「RANDOM()」が使えないためデプロイ時に注意
        # @products = Product.where.not(sale_status: 0).page(params[:page]).per(6)
    end

    def search
        # 通常は入力されたキーワードを新しい順で表示
        @keyword = params[:keyword]
        sort = params[:sort] || "created_at DESC"

        if @keyword.present?
            @search_products = Product.where('name LIKE(?) OR description LIKE(?)', "%#{@keyword}%", "%#{@keyword}%").order(sort).page(params[:page]).per(20)
        else
            # もしもヒットした商品の数をカウントして0だったらヒットしなかった表示を出す
            @search_products = Product.none
        end

        # @search_products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(20)
        # respond_to do |format|
        #   format.html 
        #   format.json 
        # end
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
