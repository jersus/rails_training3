class Post < ActiveRecord::Base
  attr_accessible :title, :category_id, :content, :published_at
  belongs_to  :category
end
