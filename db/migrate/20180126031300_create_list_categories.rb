class CreateListCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :list_categories do |t|
      t.references :user, foreign_key: true
      t.references :list_item, foreign_key: true

      t.timestamps
    end
  end
end
