class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @theme = @user.theme_color
    all_cosmetics = @user.cosmetics
    # 在庫があり(stock > 0)、かつ開封日(open_date)から1年が経過しているものをカウント
    @expired_count = all_cosmetics.where("stock > 0 AND open_date <= ?", Date.today - 1.year).count
    @stock_summary = all_cosmetics.group_by(&:genre).transform_values(&:count)

    @recent_cosmetics = all_cosmetics.order(created_at: :desc).limit(2)
  end
end
