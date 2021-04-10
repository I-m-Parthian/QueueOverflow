json.extract! question, :id, :content, :tag, :created_at, :updated_at
json.url question_url(question, format: :json)
