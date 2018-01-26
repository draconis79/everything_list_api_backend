class ListCategories < ApplicationRecord
  has_many :list_items
  has_many :users
end
