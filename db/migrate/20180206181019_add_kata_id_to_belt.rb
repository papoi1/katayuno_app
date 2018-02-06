class AddKataIdToBelt < ActiveRecord::Migration[5.1]
  def change
    add_column :belts, :kata_id, :integer
  end
end
