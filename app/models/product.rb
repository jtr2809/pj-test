class Product < ApplicationRecord
  enum category: { pizza: 'Pizza', complement: 'Complement' }
end
