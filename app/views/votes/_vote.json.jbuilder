json.extract! vote, :id, :participants, :options_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
