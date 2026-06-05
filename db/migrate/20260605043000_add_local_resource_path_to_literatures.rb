class AddLocalResourcePathToLiteratures < ActiveRecord::Migration[8.1]
  def change
    add_column :literatures, :local_resource_path, :string
  end
end
