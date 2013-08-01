class Vote < ActiveRecord::Base
  belongs_to :item
  attr_accessible :ip_address, :item_id
end