class CallbacksController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.commenter.nil?
            @user.create_commenter
        end
        sign_in_and_redirect @user
    end

end
