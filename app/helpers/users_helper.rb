module UsersHelper
    def github?(user)
        user.provider == "github"
    end
end
