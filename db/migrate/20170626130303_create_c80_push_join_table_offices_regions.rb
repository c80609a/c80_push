class CreateC80PushJoinTableOfficesRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_offices_regions, :id => false do |t|
      t.integer :office_id, :null => false
      t.integer :region_id, :null => false
    end

    add_index :c80_push_offices_regions, [:office_id, :region_id], name: 'too_long_push3'
    add_index :c80_push_offices_regions, [:region_id, :office_id], name: 'too_long_push4'

  end
end
