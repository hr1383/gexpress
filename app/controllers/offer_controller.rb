class OfferController < ApplicationController

	def index
		# puts params
		# puts Sku.collection.find({'device' =>'iphone4'}).first
	end
	def price
		 # {"device"=>"undefined", "carrier"=>"undefined", "size"=>"undefined", "condition"=>"undefined"}
		@sku  = Sku.collection.find({'device' =>params['device'], 'carrier'=>params['carrier'], 'size' => params['size'].to_i, 'lock'=>'TRUE'});
	    @sku = @sku.first	 
	end
end
