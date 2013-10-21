json.post do
  json.(@post, :id, :title, :text, :state)
  nested_comments_json(@post.comments.arrange(:order => :created_at), json)
end

