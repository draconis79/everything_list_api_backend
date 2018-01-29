class ListItem < ApplicationRecord
  has_many :users, through: :list_categories
  has_many :list_categories
end
