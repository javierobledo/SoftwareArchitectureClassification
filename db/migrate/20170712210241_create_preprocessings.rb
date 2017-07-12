class CreatePreprocessings < ActiveRecord::Migration[5.1]
  def change
    create_table :preprocessings do |t|
      t.references :corpus, foreign_key: true
      t.references :algorithm, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
