class ChengeAmountColumnNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :rankings, :amount, true
  end
end
