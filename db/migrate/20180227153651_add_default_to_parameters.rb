class AddDefaultToParameters < ActiveRecord::Migration[5.1]
  def change
    add_column :parameters, :default, :string
  end
end
