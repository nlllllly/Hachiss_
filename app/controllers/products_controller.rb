class ProductsController < ApplicationController
	before_action :authenticate_customer!, only: [:favorite]
    before_action :set_product, only: [:show]
    before_action :set_sidebar, only: [:index, :show, :search, :favorite]

    def index
        selection = params[:sort]

        if selection.present?
            # ソートの並べ替えを行った商品を表示
            @products = Product.sort(selection).where.not(sale_status: 0).page(params[:page]).per(16)
        else
            # 通常通りに販売停止中以外の商品を表示する
            @products = Product.where.not(sale_status: 0).page(params[:page]).per(16)
        end

    end
    
    def show
        @cart_item = CartItem.new
        @product_comment = ProductComment.new
        # 販売停止中以外の商品で、生産者のidが紐づくものだけをランダムに6つ表示する（本番環境はRANDを使用）
        if Rails.env.development? || Rails.env.test?
            @products = Product.where.not(sale_status: 0).where(producer_id: @product.producer_id).order(Arel.sql("RANDOM()")).limit(6)
        else
            @products = Product.where.not(sale_status: 0).where(producer_id: @product.producer_id).order(Arel.sql("RAND()")).limit(6)
        end
    end

    def search
        @keyword = params[:keyword]

        if @keyword.present?
            @search_products = Product.where.not(sale_status: 0).where('name LIKE(?) OR description LIKE(?)', "%#{@keyword}%", "%#{@keyword}%").page(params[:page]).per(15)
            respond_to do |format|
                format.html 
                format.json
            end
        else
            @search_products = Product.none
        end

    end

    def favorite
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
