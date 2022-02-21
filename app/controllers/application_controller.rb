# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def user_signed_in?
    session[:session].present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:session])
  end

  def authenticate!
    # 如果沒登入，轉去登入頁面
    redirect_to sign_in_path, notice: '請先登入會員' unless user_signed_in?
  end
end
