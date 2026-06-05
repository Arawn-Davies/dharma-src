class AddIndexesToLiteratures < ActiveRecord::Migration[8.1]
  def change
    add_index :literatures, :slug, unique: true
    add_index :literatures, :position
  end
end
