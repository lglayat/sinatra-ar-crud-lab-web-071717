class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table(:posts)
    add_column(:posts, :name, :string)
    add_column(:posts, :content, :string)
  end
end
