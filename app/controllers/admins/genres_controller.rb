class Admins::GenresController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_genre, only: [:edit, :update]

    def index
        @genres = Genre.page(params[:page]).per(20)
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to request.referer, notice: "ジャンルを追加しました"
        else
            render :index, alert: "保存できませんでした"
        end 
    end

    def edit
    end

    def update
        if @genre.update(genre_params)
            redirect_to admins_genres_path
        else
            render :index, alert: "保存できませんでした"
        end
    end



    private
    def genre_params
        params.require(:genre).permit(:name, :genre_status)
    end

    def set_genre
        @genre = Genre.find(params[:id])
      end

end
