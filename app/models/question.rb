class Question < ApplicationRecord
    validates :content, :tag, presence: true
    has_many :answer, dependent: :destroy
    belongs_to :user

    def self.search(search)
        if search 
            where(["tag LIKE ?","%#{search}%"]).order(:updated_at).reverse_order
        else
            all.order(:updated_at).reverse_order
        end
    end 
end
