class Product < ApplicationRecord
  enum type: { pizza: 'Pizza', complement: 'Complement' }
end
