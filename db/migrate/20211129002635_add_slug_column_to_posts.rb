class AddSlugColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :slug, :string, unique: true # unique = Pois dois posts não podem ter uma mesma url
  end
end
