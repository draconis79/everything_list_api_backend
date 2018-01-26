class ListItem < ApplicationRecord
  belongs_to :users
  belongs_to :list_categories
end
