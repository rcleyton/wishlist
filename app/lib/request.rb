module Request

  def get_product
    url = 'http://challenge-api.luizalabs.com/api/product/'
    product_id = HTTParty.get("#{url}#{params[:product_id]}/")
    product_id.code == 200 ? product_id.body : product_id = 404
  end 

end