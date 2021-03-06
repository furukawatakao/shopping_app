class Admin::UsersController < Admin::ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_url(@user.id), notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}を更新しました。」"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confimation)
  end
end
