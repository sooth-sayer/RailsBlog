class Post::Comment < ActiveRecord::Base
  has_ancestry
  belongs_to :post
end
