class CreateValuedPreParameters < ActiveRecord::Migration[5.1]
  def change
    create_table :valued_pre_parameters do |t|
      t.string :value
      t.references :parameter, foreign_key: true
      t.references :preprocessing, foreign_key: true

      t.timestamps
    end
  end
end
