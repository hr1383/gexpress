class SkuController < ApplicationController
  
  def price
  	if params['carrier'] == 'undefined' && params['device'].starts_with?('ipod')
  	 sku = Sku.collection.find({'device' =>params['device'], 'size' => params['size'].to_i, 'state'=>params['state']})
  	 	.first;	
  	else  	
  	 sku = Sku.collection.find({'device' =>params['device'], 'carrier'=>params['carrier'], 'size' => params['size'].to_i,
  	  'state'=>params['state']}).first;
  	end
  	puts sku.count
  	 respond_to do |format|    	
    	format.json  { render :json => sku } # don't do msg.to_json
  end
  end
end
