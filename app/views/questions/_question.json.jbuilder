json.extract! question, :id, :image, :description, :answer, :level, :created_at, :updated_at
json.url question_url(question, format: :json)
