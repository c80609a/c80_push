class CreateC80PushPresets < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_presets do |t|
      t.string :title, null: false, limit: 90
      t.string :color, null: false, limit: 10
      t.timestamps null: false
    end
  end
end
