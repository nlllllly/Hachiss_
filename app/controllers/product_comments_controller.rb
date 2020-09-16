class ProductCommentsController < ApplicationController
    before_action :authenticate_customer!

    def create
        product = Product.find(params[:product_id])
        comment = current_customer.product_comments.new(product_comment_params)
        comment.product_id = product.id
        comment.save
        redirect_to  request.referer, notice: "商品のコメントを投稿しました"
    end
    
    def destroy
        ProductComment.find_by(id: params[:id], product_id: params[:product_id]).destroy
        redirect_to  request.referer, notice: "商品のコメントを削除しました"
    end
    


    

    private
    def product_comment_params
        params.require(:product_comment).permit(:comment)
    end
end
