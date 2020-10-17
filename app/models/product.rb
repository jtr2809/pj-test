class Product < ApplicationRecord
  has_and_belongs_to_many :orders
  enum category: { pizza: 'Pizza', complement: 'Complement' }
end
