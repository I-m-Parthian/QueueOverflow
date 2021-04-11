class Question < ApplicationRecord
    validates :content, :tag, presence: true
    has_many :answer
    belongs_to :user
end
