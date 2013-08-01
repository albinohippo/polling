class Poll < ActiveRecord::Base
	has_many :items, :dependent => :destroy
  attr_accessible :name, :question
  accepts_nested_attributes_for :items
  validate :items_count, :on => :update

  def items_count
  	errors.add(:items, "must be between 2 and 5.") if (self.items.count <= 1 || self.items.count >= 6)
  end
end