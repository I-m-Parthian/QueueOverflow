class Question < ApplicationRecord
    validates :content, :tag, presence: true
end
