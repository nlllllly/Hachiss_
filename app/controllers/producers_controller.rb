class ProducersController < ApplicationController
    before_action :authenticate_customer!, only: [:favorite]
    before_action :set_producer, only: [:show]
    before_action :set_sidebar, only: [:index, :show, :favorite]

    def index
        # ステータスが有効の生産者のみ表示
        @producers = Producer.where(producer_status: 1).page(params[:page]).per(16)
    end
    
    def show
        # 商品の中でも生産者に紐づくものだけを表示
        @products = Product.where(producer_id: @producer.id).page(params[:page]).per(6)
    end

    def favorite
    end




    private
    def set_producer
        @producer = Producer.find(params[:id])
    end

    def set_sidebar
        # ステータスが有効のジャンルを表示する
        @genres = Genre.where(genre_status: 1).all
        # ステータスが無効ではない生産者を表示する
        @producers = Producer.where.not(producer_status: 0).all
    end
    
end
