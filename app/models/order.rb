class Order < ApplicationRecord
  belongs_to :store
  has_and_belongs_to_many :products

  before_save :calculate_total

  def api_json
    {
      id: id,
      store_id: store_id,
      created_at: created_at,
      updated_at: updated_at,
      product_ids: product_ids,
      total: total
    }
  end

  def self.api_json
    Order.all.map(&:api_json)
  end

  def calculate_total
    total = 0
    products.map do |product|
      total += product.price
    end
    self.total = total
  end
end
