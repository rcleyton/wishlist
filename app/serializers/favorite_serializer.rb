class FavoriteSerializer < ActiveModel::Serializer
  attributes :product

  def product
    object.product.map { |prod| JSON.parse(prod) }
  end
end
