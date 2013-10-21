module Api::V1::Posts::CommentsHelper
  def nested_comments_json(comments, json)
    json.comments comments do |comment|
      json.partial! "api/v1/posts/comments/comment", comment: comment_from_arranged(comment)
      nested_comments_json(subtree_from_arranged(comment), json)
    end
  end

  private
    def comment_from_arranged(arranged_item)
      arranged_item[0]
    end

    def subtree_from_arranged(arranged_item)
      arranged_item[1]
    end
end
