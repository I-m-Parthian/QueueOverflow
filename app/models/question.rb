class Question < ApplicationRecord
    validates :content, :tag, presence: true
    has_many :answer, dependent: :destroy
    belongs_to :user
end
