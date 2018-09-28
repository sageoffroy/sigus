class AddDependeceToFreeDay < ActiveRecord::Migration[5.1]
  def change
    add_reference :free_days, :dependence, foreign_key: true
  end
end
