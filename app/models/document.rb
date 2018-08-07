require 'csv'

class Document < ApplicationRecord
  belongs_to :preprocessing
  has_many :cluster_documents, dependent: :destroy
  def self.to_csv
    attributes = %w{title year category content}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |document|
        csv << attributes.map{ |attr| document.send(attr) }
      end
    end
  end

  def self.import(file, preprocessing_id)
    CSV.foreach(file.path, headers: true) do |row|
      data = row.to_hash
      data[:preprocessing_id] = preprocessing_id
      Document.create! data
    end
  end
end
