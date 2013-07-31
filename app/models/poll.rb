class Poll < ActiveRecord::Base
	has_many :items
  attr_accessible :name, :question
end