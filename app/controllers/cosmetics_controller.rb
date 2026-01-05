class CosmeticsController < ApplicationController

  def index
    @cosmetics = current_user.cosmetics.order(created_at: :desc)
    @theme = current_user.theme_color
    if params[:genre_id].present?
      @cosmetics = @cosmetics.where(genre_id: params[:genre_id])
    end
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

  def show
    @cosmetic = Cosmetic.find(params[:id])
    @theme = current_user.theme_color
  end

  def edit
    @cosmetic = Cosmetic.find(params[:id])
    @theme = current_user.theme_color
  end

  def update
    @cosmetic = Cosmetic.find(params[:id])
    if @cosmetic.update(cosmetic_params)
      redirect_to cosmetic_path(@cosmetic), notice: "コスメ情報を更新しました！"
    else
      @theme = current_user.theme_color
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    cosmetic = Cosmetic.find(params[:id])
    cosmetic.destroy
    redirect_to cosmetics_path, notice: "コスメを削除しました"
  end

  private

  def cosmetic_params
    params.require(:cosmetic).permit(
      :image, :name, :brand, :price, :genre_id, :color_id, 
      :usage_count_id, :purchase_date, :open_date, 
      :stock, :official_url, :is_favorite
    ).merge(user_id: current_user.id)
  end
end
