class SkuController < ApplicationController
  
  def price
  	 sku = Sku.collection.find({'device' =>params['device'], 'carrier'=>params['carrier'], 'size' => params['size'].to_i,
  	  'state'=>params['state']}).first;
  	 respond_to do |format|    	
    	format.json  { render :json => sku } # don't do msg.to_json
  end
  end
end