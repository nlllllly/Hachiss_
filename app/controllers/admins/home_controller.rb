class Admins::HomeController < ApplicationController
  before_action :authenticate_admin!

  def index
    # 今日の注文
    @today_orders = Order.where(created_at: Time.zone.now.all_day).page(params[:page])
    # 今週の注文
    # @weekly_orders = Order.where(created_at: 1.week.ago.now.all_day).page(params[:page])
    # 今月の注文
    # @monthly_orders = Order.where(created_at: 1.month.ago.now.all_day).page(params[:page])
  end

end
