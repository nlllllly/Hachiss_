class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters , if: :devise_controller?








    

    protected
        def configure_permitted_parameters
        # 会員登録時のカラム入力許可
        devise_parameter_sanitizer.permit(:sign_up, keys: [
            :last_name_kana,
            :first_name_kana,
            :last_name,
            :first_name,
            :postcode,
            :prefecture_name,
            :prefecture_code,
            :address_city,
            :address_street,
            :address_building,
            :phone_number,
            :is_deleted
        ])
        # 会員情報更新時のカラム入力許可
        devise_parameter_sanitizer.permit(:account_update, keys: [
            :last_name_kana,
            :first_name_kana,
            :last_name,
            :first_name,
            :postcode,
            :prefecture_name,
            :prefecture_code,
            :address_city,
            :address_street,
            :address_building,
            :phone_number,
            :is_deleted
        ])
        end

end
