class RegistrationsController < Devise::RegistrationsController

    def create
        super
        if resource.persisted?
            resource.create_commenter
        end
    end

    private

    def sign_up_params
        params.require(:user).permit(   :name,
                                        :email,
                                        :password,
                                        :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(   :name,
                                        :email,
                                        :password,
                                        :password_confirmation,
                                        :current_password)
    end
end
