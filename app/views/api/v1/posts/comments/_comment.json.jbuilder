json.(comment, :id, :body)
json.commenter do
  json.id comment.commenter.id
  json.name comment.commenter.name
  json.email comment.commenter.email
end

