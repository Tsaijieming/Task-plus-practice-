class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def account_verify
    @user = User.new(user_params)
    if @user.save
      redirect_to "/" ,notice: '註冊會員成功！'
    else
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end

  def check
    u = User.login(params[:user])
    if u
      session[:session] = u.id
      redirect_to "/" ,notice: '登入會員成功！'
    else
      redirect_to sign_in_path ,notice: '無此會員 或 密碼錯誤'
    end
  end

  def sign_out
    session[:session] = nil
    redirect_to courses_path, notice: '已登出'
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end