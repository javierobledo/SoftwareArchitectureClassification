class CreateClusterDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :cluster_documents do |t|
      t.references :cluster, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
