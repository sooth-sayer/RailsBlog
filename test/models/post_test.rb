require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "#save without title" do
    post = Post.new
    assert !post.save, "Post without the title could not be saved"
  end
end
