class CreateComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, index: true

      t.timestamps
    end
  end
end
