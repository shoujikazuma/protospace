class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_out_path_for(resource)
      '/users/sign_in' # サインアウト後のリダイレクト先URL
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){|u|u.permit(:nickname, :avatar, :profile, :member, :works)}
      devise_parameter_sanitizer.permit(:update){|u|u.permit(:nickname, :email, :avatar, :profile, :work, :member, :password)}
    end
end

# def configure_permitted_parameters
#       devise_parameter_sanitizer.permit(:sign_up){|u|u.permit(:nickname, :avatar, :profile, :member, :works)}
#       devise_parameter_sanitizer.permit(:update){|u|u.permit(:nickname, :email, :avatar, :profile, :work, :member, :password)}
#     end
#（メモ）
#なかなかeditしてもエラーが出ていたので、調べて、上記の書き方にしたら、デーダベースに保存されるようになったんやけど、editボタン押す度にsign_inページに飛んでしまってsign_inすればuserのshowページ飛んでくれるようになった。