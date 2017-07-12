class CreateCorpora < ActiveRecord::Migration[5.1]
  def change
    create_table :corpora do |t|
      t.string :name
      t.text :description
      t.string :language

      t.timestamps
    end
  end
end
