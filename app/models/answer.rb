class Answer < ApplicationRecord
    # validates :content, presence: true
    # validates :content, format: { with: /\A[a-zA-Z0-9]*\z/,
    #     message: "allow alphanumeric values, only as of now." }, presence: true
    belongs_to :question
    belongs_to :user
    has_one :validvote, dependent: :destroy
end
