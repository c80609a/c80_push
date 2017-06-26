class CreateC80PushDealers < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_dealers do |t|
      t.string :title, null: false, limit: 90
      t.timestamps null: false
    end
  end
end
