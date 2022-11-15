class AddImagesToFields < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :featured_img, :string
  end
end
