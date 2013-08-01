class Item < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  belongs_to :poll
  attr_accessible :content, :poll_id
  validates_presence_of :content, :poll_id
  validate :check_poll_items

  def check_poll_items
  	errors.add(:votes, "You cannot have more than 5 items") unless self.poll.items.count < 5
  end
end