class GenresController < ApplicationController
    
    before_action :set_genre, only: [:show]

    def show
        # 特定の「ジャンルid」に所属し、かつ「販売停止中」になっていない商品を表示する
        @products = @genre.products.where(genre_id: @genre.id).where.not(sale_status: 0).page(params[:page]).per(20)
    end
    
    
    
    private
    def set_genre
        @genre = Genre.find(params[:id])
    end

end
