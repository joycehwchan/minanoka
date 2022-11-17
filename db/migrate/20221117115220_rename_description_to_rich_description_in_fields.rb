class RenameDescriptionToRichDescriptionInFields < ActiveRecord::Migration[7.0]
  def change
    rename_column :fields, :description, :rich_description
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
