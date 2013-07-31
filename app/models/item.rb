class Item < ActiveRecord::Base
  has_many :votes
  belongs_to :poll
  attr_accessible :content
end
