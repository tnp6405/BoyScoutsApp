class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes, {:id=>false} do |t|
      t.primary_key :route_id
      t.string :routeName
      t.integer :printSequence

      t.timestamps
    end
  end
end
