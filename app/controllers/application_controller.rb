# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale
  
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

  # 設定語系
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # 語系切換
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
