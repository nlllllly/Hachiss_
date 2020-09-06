class Admins::ProducersController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_producer, only: [:show, :edit, :update, :destroy]
    
    def index
        @producers = Producer.page(params[:page]).per(30)
    end

    def new
        @producer = Producer.new
    end
    
    def create
        @producer = Producer.new(producer_params)
        if @producer.save
            redirect_to admins_producer_path(@producer)
        else
            render :new, alert: "保存できませんでした"
        end
    end
    
    def show
    end

    def edit
    end
    
    def update
        if @producer.update(producer_params)
            redirect_to admins_producer_path(@producer)
        else
            render :edit, alert: "保存できませんでした"
        end
    end
    
    def destroy
        if @producer.destroy
            redirect_to admins_producers_path
        else
            render :show, alert: "削除できませんでした"
        end
    end
    

    private
    def producer_params
        params.require(:producer).permit(:name, :image, :description, :producer_status)
    end

    def set_producer
        @producer = Producer.find(params[:id])
    end

end
