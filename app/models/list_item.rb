class ListItem < ApplicationRecord
  belongs_to :user
  belongs_to :list_category
end
