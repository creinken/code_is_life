class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable

    # relationships
    has_many :projects

    # instance methods
    def get_projects_from_github(url)
        response = Excon.get(url)

        return nil if response.status != 200

        JSON.parse(response.body)
    end

    # class methods
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.name = auth.info.name
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
        end
    end
end
