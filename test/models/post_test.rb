require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "#save without title" do
    post = Post.new
    assert ("Post without the title could not be saved") { !post.save }
  end
end
