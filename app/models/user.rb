class User < ApplicationRecord
  has_many :list_categories
  has_many :list_items, through: list_categories
end
