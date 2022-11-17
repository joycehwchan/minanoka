class MigrateDescriptionstoRichDescriptionFields < ActiveRecord::Migration[6.0]
  def up
    Field.find_each do |field|
      field.update(rich_description: field.description)
    end
  end

  def down
    Field.find_each do |field|
      field.update(description: field.rich_description)
      field.update(rich_body: nil)
    end
  end
end
