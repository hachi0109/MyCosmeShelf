class CosmeticsController < ApplicationController

  def index
    @cosmetics = current_user.cosmetics.includes(:genre)
  end

  def new
    @cosmetic = Cosmetic.new
    @user = current_user
    @theme = @user.theme_color
  end

  def create
    @cosmetic = current_user.cosmetics.build(cosmetic_params)
    if @cosmetic.save
      redirect_to user_root_path, notice: "新しいコスメを登録しました！"
    else
      @user = current_user
      @theme = @user.theme_color
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cosmetic_params
    params.require(:cosmetic).permit(
      :name, :brand, :price, :genre_id, :color_id, 
      :usage_count_id, :purchase_date, :open_date, 
      :stock, :official_url, :is_favorite
    )
  end
end
