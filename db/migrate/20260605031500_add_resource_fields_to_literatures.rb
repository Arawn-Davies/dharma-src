class AddResourceFieldsToLiteratures < ActiveRecord::Migration[8.1]
  def change
    add_column :literatures, :resource_url, :text
    add_column :literatures, :resource_format, :string
    add_column :literatures, :resource_kind, :string
    add_column :literatures, :attribution, :text
  end
end
