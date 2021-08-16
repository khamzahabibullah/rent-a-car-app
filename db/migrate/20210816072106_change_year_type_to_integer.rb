class ChangeYearTypeToInteger < ActiveRecord::Migration[6.1]
  def change
    # change_column :cars, :year, :integer
    remove_column :cars, :year, :date
    add_column :cars, :year, :integer
  end
end
