json.array!(@votes) do |vote|
  json.extract! vote, :id, :yes, :no, :question_id_id, :user_id_id
  json.url vote_url(vote, format: :json)
end
