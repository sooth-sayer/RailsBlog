class AddAncestryToPostComments < ActiveRecord::Migration
  def change
    add_column :post_comments, :ancestry, :string
  end
end
