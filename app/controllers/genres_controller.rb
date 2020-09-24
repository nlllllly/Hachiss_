class GenresController < ApplicationController
    
    before_action :set_genre, only: [:show]
    before_action :set_sidebar, only: [:index, :show, :search]

    def show
        # 特定の「ジャンルid」に所属し、かつ「販売停止中」になっていない商品を表示する
        @products = @genre.products.where(genre_id: @genre.id).where.not(sale_status: 0).page(params[:page]).per(16)
    end
    
    
    
    private
    def set_genre
        @genre = Genre.find(params[:id])
    end

    def set_sidebar
        # ステータスが有効のジャンルを表示する
        @genres = Genre.where.not(genre_status: 0).all
        # ステータスが有効の生産者を表示する
        @producers = Producer.where.not(producer_status: 0).all
    end

end
