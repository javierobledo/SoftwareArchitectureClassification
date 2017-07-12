class CreateClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :classifications do |t|
      t.string :name
      t.references :algorithm, foreign_key: true
      t.references :preprocessing, foreign_key: true

      t.timestamps
    end
  end
end
