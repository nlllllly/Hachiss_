class GenresController < ApplicationController
    
    def show
        @genres = Genre.where(genre_status: :active)
        @genre = Genre.find(params[:id])
        @products = @genre.products.where(genre_status: :active).page(params[:page]).per(8)
        @product = @genre.products.where(genre_status: :active)
    end


end
