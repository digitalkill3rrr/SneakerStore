class AddLogosToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :logos, :string
  end
end
