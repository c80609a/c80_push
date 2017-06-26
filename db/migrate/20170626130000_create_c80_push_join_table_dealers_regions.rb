class CreateC80PushJoinTableDealersRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_dealers_regions, :id => false do |t|
      t.integer :dealer_id, :null => false
      t.integer :region_id, :null => false
    end

    add_index :c80_push_dealers_regions, [:dealer_id, :region_id], name: 'too_long_push1'
    add_index :c80_push_dealers_regions, [:region_id, :dealer_id], name: 'too_long_push2'

  end
end
