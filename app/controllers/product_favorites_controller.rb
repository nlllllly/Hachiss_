class ProductFavoritesController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_product_id, only: [:create, :destroy]

    def create
        favorite = current_customer.product_favorites.new(product_id: @product.id)
        favorite.save
    end
    
    def destroy
        favorite = current_customer.product_favorites.find_by(product_id: @product.id)
        favorite.destroy
    end



    private
    def set_product_id
        @product = Product.find(params[:product_id])
    end

end
