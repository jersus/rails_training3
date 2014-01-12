class AddColumnCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer, :after => :title
  end
end
