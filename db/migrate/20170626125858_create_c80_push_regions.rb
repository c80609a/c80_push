class CreateC80PushRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_regions do |t|
      t.integer :ord, null: false, default: 0
      t.string :title, null: false, limit: 90
      t.timestamps null: false
    end
  end
end
