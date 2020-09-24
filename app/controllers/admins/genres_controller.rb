class Admins::GenresController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_genre, only: [:edit, :update, :destroy]

    def index
        @genres = Genre.page(params[:page]).per(16)
        @genre = Genre.new
    end
    
    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to request.referer, notice: "登録が完了しました"
        else
            @genres = Genre.page(params[:page]).per(16)
            render :index, alert: "登録できませんでした"
        end 
    end
    
    def edit
    end
    
    def update
        if @genre.update(genre_params)
            redirect_to admins_genres_path, notice: "変更を保存しました"
        else
            @genres = Genre.page(params[:page]).per(16)
            render :index, alert: "変更を保存できませんでした"
        end
    end
    
    def destroy
        if @genre.destroy
            redirect_to admins_genres_path, notice: "削除が完了しました"
        else
            @genres = Genre.page(params[:page]).per(16)
            render :index, alert: "削除できませんでした"
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
