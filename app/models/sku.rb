class Sku
  include Mongoid::Document
  field :device
  field :carrier
  field :price, :type => Integer
  field :size, :type => Integer
  field :state
end
