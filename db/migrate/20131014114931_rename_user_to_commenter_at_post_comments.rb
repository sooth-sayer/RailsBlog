class RenameUserToCommenterAtPostComments < ActiveRecord::Migration
  def change
    rename_column :post_comments, :user_id, :commenter_id
  end
end
