class Board < ActiveRecord::Base
  attr_accessible :name, :description, :closed
end
