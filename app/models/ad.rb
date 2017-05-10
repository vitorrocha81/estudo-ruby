class Ad < ActiveRecord::Base
  belongs_to :member
  belongs_to :category

  #money
  monetize :price_cents
end
