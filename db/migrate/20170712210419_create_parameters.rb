class CreateParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :parameters do |t|
      t.string :name
      t.string :typeof
      t.references :algorithm, foreign_key: true

      t.timestamps
    end
  end
end
