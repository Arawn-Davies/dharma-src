class CreateLiteratures < ActiveRecord::Migration[8.1]
  def change
    create_table :literatures do |t|
      t.string :title
      t.string :slug
      t.string :tradition
      t.text :summary
      t.text :body
      t.text :source_note
      t.integer :position

      t.timestamps
    end
  end
end
