class CreateClusters < ActiveRecord::Migration[5.1]
  def change
    create_table :clusters do |t|
      t.string :name
      t.references :classification, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
