json.extract! answer, :id, :content, :up_vote, :down_vote, :created_at, :updated_at
json.url answer_url(answer, format: :json)
