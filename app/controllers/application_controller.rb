class ApplicationController < ActionController::Base
# 後々アクセス権限を加える

# ユーザー管理用のbefore_action
  before_action :configure_permitted_parameters, if: :devise_controller?
# キーワード検索機能のbefore_action
  before_action :set_search
# イン・アウト後の遷移記述
 private

 def set_search
   #@query ={ title_or_content_cont: params[:q] }
   #@search = Ore.ransack(@query)
   @search = Ore.ransack(params[:q])
   @search_jewelries = @search.result.order(created_at: :desc).page(params[:page])
 end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :admin
        admin_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :last_name_kana,
    :first_name_kana, :email, :password, :postal_code, :address, :telephone_number, :is_deleted])
  end
end