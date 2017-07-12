class CreateValuedClaParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :valued_cla_parameters do |t|
      t.string :value
      t.references :parameter, foreign_key: true
      t.references :classification, foreign_key: true

      t.timestamps
    end
  end
end
