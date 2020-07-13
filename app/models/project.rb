class Project < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :commenters, through: :comments
    # scope :imported,    -> { where(imported: true) }
    scope :get_lang,   ->(lang) { where("language = ?", lang) }

    validates :name, presence: true

    def self.get_uniq_langs
        Project.all.collect{ |p| p.language }.uniq
    end

    def self.relate_to_record(array)
        array.collect { |proj| Project.find_by(id: proj.id) }
    end

end
