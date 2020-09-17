class ProductCommentsController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_product_id, only: [:create, :destroy]

    def create
        product = Product.find(params[:product_id])
        comment = current_customer.product_comments.new(product_comment_params)
        comment.product_id = product.id
        if comment.save
            redirect_to request.referer, notice: "商品のコメントを投稿しました"
        else
            redirect_to request.referer, alert: "コメントを投稿できませんでした"
        end
    end
    
    def destroy
        ProductComment.find_by(id: params[:id], product_id: params[:product_id]).destroy
        redirect_to  request.referer, notice: "商品のコメントを削除しました"
    end
    


    

    private
    def product_comment_params
        params.require(:product_comment).permit(:comment, :rate)
    end

    def set_product_id
        @product = Product.find(params[:product_id])
    end
    


end
