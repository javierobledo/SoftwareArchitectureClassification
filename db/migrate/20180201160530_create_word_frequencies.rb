class CreateWordFrequencies < ActiveRecord::Migration[5.1]
  def change
    create_table :word_frequencies do |t|
      t.string :content
      t.integer :frequency
      t.references :cluster, foreign_key: true

      t.timestamps
    end
  end
end
