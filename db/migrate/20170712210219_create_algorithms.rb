class CreateAlgorithms < ActiveRecord::Migration[5.1]
  def change
    create_table :algorithms do |t|
      t.string :name
      t.text :description
      t.string :DOI

      t.timestamps
    end
  end
end
