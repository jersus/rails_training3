class Category < ActiveRecord::Base
  attr_accessible :name, :posts_count
  has_many :posts
end
