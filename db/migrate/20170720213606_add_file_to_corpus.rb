class AddFileToCorpus < ActiveRecord::Migration[5.1]
  def change
    add_column :corpora, :corpus_file, :string
  end
end
