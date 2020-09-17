class ProducersController < ApplicationController

    before_action :set_producer, only: [:show]

    def index
        # ステータスが有効の生産者のみ表示
        @producers = Producer.where(producer_status: 1).page(params[:page]).per(20)
    end
    
    def show
        # 商品の中でも生産者に紐づくものだけを表示
        @products = Product.where(producer_id: @producer.id).page(params[:page]).per(4)
    end




    private
    def set_producer
        @producer = Producer.find(params[:id])
    end
    
end
