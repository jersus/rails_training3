class AddColumnPostsCountToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :posts_count, :integer, :default => 0, :after => :name

    Category.reset_column_information
    Category.find_each do |category|
      Category.reset_counters category.id, :posts
    end
  end

  def down
  end
end
