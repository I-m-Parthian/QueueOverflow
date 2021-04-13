class Question < ApplicationRecord
    validates :content, :tag, presence: true
    has_many :answer, dependent: :destroy
    belongs_to :user

    def self.search(search)
        if search 
            where(["tag LIKE ?","%#{search}%"])
        else
            all
        end
    end 
end
