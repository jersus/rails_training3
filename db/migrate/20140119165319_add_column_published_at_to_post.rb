class AddColumnPublishedAtToPost < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :datetime, :after => :content
  end
end
