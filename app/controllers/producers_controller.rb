class ProducersController < ApplicationController

    before_action :set_producer, only: [:show]

    def index
        @producers = Producer.page(params[:page]).per(20)
    end
    
    def show
        @products = Product.where(producer_id: @producer.id).page(params[:page]).per(20)
    end




    private
    def set_producer
        @producer = Producer.find(params[:id])
    end
    
end
