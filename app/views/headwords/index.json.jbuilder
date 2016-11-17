json.array!(@headwords) do |headword|
  json.extract! headword, :id
  json.url headword_url(headword, format: :json)
end
