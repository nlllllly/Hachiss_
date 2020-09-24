class Admins::ProductsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_product, only: [:show ,:edit, :update, :destroy]

    def index
        # もし、検索ワードがあれば、検索結果を表示 / なければ通常の表示
        @keyword = params[:keyword]
        if @keyword.present?
            @products = Product.where('name LIKE(?)', "%#{@keyword}%").page(params[:page]).per(16)
        else
            @products = Product.page(params[:page]).per(16)
        end
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admins_product_path(@product), notice: "登録が完了しました"
        else
            render :new, alert: "登録できませんでした"
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @product.update(product_params)
            redirect_to admins_product_path(@product), notice: "変更を保存しました"
        else
            render :edit, alert: "変更を保存できませんでした"
        end
    end
    
    def destroy
        if @product.destroy
            redirect_to admins_products_path, notice: "削除が完了しました"
        else
            @products = Product.page(params[:page]).per(16)
            render :index, alert: "削除できませんでした"
        end
    end
    

    private
    def product_params
        params.require(:product).permit(:name, :image, :price, :genre_id, :description, :producer_id, :sale_status)
    end
    
    def set_product
        @product = Product.find(params[:id])
    end

end
