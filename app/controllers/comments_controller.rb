class CommentsController < ApplicationController
  def create
    @cosmetic = current_user.cosmetics.find(params[:cosmetic_id])
    @comment = @cosmetic.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.html { redirect_to cosmetic_path(@cosmetic), notice: "口コミを投稿しました" }
        format.turbo_stream
      end
    else
      redirect_to cosmetic_path(@cosmetic), alert: "投稿に失敗しました。入力内容を確認してください。"
    end
  end

  def destroy
    @cosmetic = current_user.cosmetics.find(params[:cosmetic_id])
    @comment = @cosmetic.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to cosmetic_path(@cosmetic), notice: "口コミを削除しました" }
      format.turbo_stream
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :rating, :status_id)
  end
end
