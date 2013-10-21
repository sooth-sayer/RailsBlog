json.posts do
  json.array! @posts, :id, :title, :text, :state
end
