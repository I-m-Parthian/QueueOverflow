class Answer < ApplicationRecord
    validates :content, format: { with: /\A[a-zA-Z0-9]*\z/,
        message: "allow alphanumeric values, only as of now." }, presence: true
end
