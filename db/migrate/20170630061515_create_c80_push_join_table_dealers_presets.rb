class CreateC80PushJoinTableDealersPresets < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_dealers_presets, :id => false do |t|
      t.integer :dealer_id, :null => false
      t.integer :preset_id, :null => false
    end

    add_index :c80_push_dealers_presets, [:dealer_id, :preset_id], name: 'too_long_push11'
    add_index :c80_push_dealers_presets, [:preset_id, :dealer_id], name: 'too_long_push12'

  end
end
