class SeedLiteratureResources < ActiveRecord::Migration[8.1]
  def up
    load Rails.root.join("db/seeds.rb")
  end

  def down
    # Resource seed data is intentionally retained.
  end
end
