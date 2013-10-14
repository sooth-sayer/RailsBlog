class RemoveCommenterFromPostComments < ActiveRecord::Migration
  def change
    remove_column :post_comments, :commenter, :string
  end
end
