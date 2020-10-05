class HomeController < ApplicationController
    
    def index
        # 商品を最新順からに5つだけ表示
        @rand_products = Product.where.not(sale_status: 0).order(created_at: :DESC).limit(5)
        # 商品を人気順にランキングで5つだけ表示
        @rank_products = Product.where.not(sale_status: 0).find(OrderDetail.group(:product_id).order('count(product_id) desc').limit(5).pluck(:product_id))
        # 生産者をランダムに5つだけ表示（本番環境はRANDを使用）
        if Rails.env.development? || Rails.env.test?
            @rand_producers = Producer.where(producer_status: 1).order(Arel.sql("RANDOM()")).limit(5)
        else
            @rand_producers = Producer.where(producer_status: 1).order(Arel.sql("RAND()")).limit(5)
        end
    end


end
