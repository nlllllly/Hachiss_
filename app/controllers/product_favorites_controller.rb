class ProductFavoritesController < ApplicationController
    before_action :authenticate_customer!

    def create
        product = Product.find(params[:product_id])
        favorite = current_customer.product_favorites.new(product_id: product.id)
        favorite.save
        redirect_to request.referer, notice: "商品をお気に入り登録しました"
    end
    
      def destroy
        product = Product.find(params[:product_id])
        favorite = current_customer.product_favorites.find_by(product_id: product.id)
        favorite.destroy
        redirect_to request.referer, notice: "商品をお気に入りから削除しました"
    end
end
