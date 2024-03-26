class CreateDaysUntilShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :days_until_shippings do |t|

      t.timestamps
    end
  end
end
