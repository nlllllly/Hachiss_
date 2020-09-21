class HomeController < ApplicationController
    
    def index
        # 商品を最新順からに5つだけ表示
        @rand_products = Product.where.not(sale_status: 0).order(created_at: :DESC).limit(5)
        # 商品を人気順にランキングで5つだけ表示
        @rank_products = Product.where.not(sale_status: 0).find(OrderDetail.group(:product_id).order('count(product_id) desc').limit(5).pluck(:product_id))
        # 生産者をランダムに5つだけ表示
        @rand_producers = Producer.where(producer_status: 1).order(Arel.sql("RANDOM()")).limit(5)
        # 本番環境では「RANDOM()」が使えないためデプロイ時に注意
        # @rand_producers = Producer.where(producer_status: 1).page(params[:page]).per(6)
    end


end
