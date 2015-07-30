class Sku
  include Mongoid::Document
  field :device
  field :carrier
  field :lock
  field :size, :type => Integer
  field :good, :type => Integer
  field :bad, :type => Integer
  field :flawless, :type => Integer
  field :broken, :type => Integer
end
