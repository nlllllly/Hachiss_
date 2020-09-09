class GenresController < ApplicationController
    
    before_action :set_genre, only: [:show]

    def show
        # ジャンルidに所属し、かつ「販売中」か「売り切れ」の商品を表示する
        @products = @genre.products.where(genre_id: @genre.id, sale_status: 1 || 2).page(params[:page]).per(20)
    end
    
    
    
    private
    def set_genre
        @genre = Genre.find(params[:id])
    end

end
