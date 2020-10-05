class ProductCommentsController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_product_id, only: [:create, :destroy]
    before_action :set_sidebar, only: [:create]

    def create
        product = Product.find(params[:product_id])
        comment = current_customer.product_comments.new(product_comment_params)
        comment.product_id = product.id
        if comment.save
            redirect_to request.referer, notice: "商品のコメントを投稿しました"
        else
            @cart_item = CartItem.new
            @product_comment = ProductComment.new
            # 本番環境は表示にRANDを使用
            if Rails.env.development? || Rails.env.test?
                @products = Product.where.not(sale_status: 0).where(producer_id: @product.producer_id).order(Arel.sql("RANDOM()")).limit(6)
            else
                @products = Product.where.not(sale_status: 0).where(producer_id: @product.producer_id).order(Arel.sql("RAND()")).limit(6)
            end
            
            render template: "products/show", alert: "コメントを投稿できませんでした"

        end
    end
    
    def destroy
        ProductComment.find_by(id: params[:id], product_id: params[:product_id]).destroy
        redirect_to request.referer, notice: "商品のコメントを削除しました"
    end
    


    

    private
    def product_comment_params
        params.require(:product_comment).permit(:comment, :rate)
    end

    def set_product_id
        @product = Product.find(params[:product_id])
    end

    def set_sidebar
        # ステータスが有効のジャンルを表示する
        @genres = Genre.where(genre_status: 1).all
        # ステータスが無効ではない生産者を表示する
        @producers = Producer.where.not(producer_status: 0).all
    end
    


end
