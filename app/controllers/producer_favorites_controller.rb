class ProducerFavoritesController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_producer_id, only: [:create, :destroy]

    def create
        favorite = current_customer.producer_favorites.new(producer_id: @producer.id)
        favorite.save
    end
    
    def destroy
        favorite = current_customer.producer_favorites.find_by(producer_id: @producer.id)
        favorite.destroy
    end



    private
    def set_producer_id
        @producer = Producer.find(params[:producer_id])
    end
    
end
