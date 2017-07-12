class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.text :title
      t.integer :year
      t.string :category
      t.text :content
      t.references :preprocessing, foreign_key: true

      t.timestamps
    end
  end
end
