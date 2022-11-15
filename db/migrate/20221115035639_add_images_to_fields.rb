class AddImagesToFields < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :featured_img, :string
    add_column :fields, :images, :string
  end
end
