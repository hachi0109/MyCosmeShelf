class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @theme = @user.theme_color
    all_cosmetics = @user.cosmetics
    @expired_count = all_cosmetics.expired.count
    @stock_summary = all_cosmetics.group_by(&:genre).transform_values(&:count)

    @recent_cosmetics = all_cosmetics.order(created_at: :desc).limit(2)
  end
end
