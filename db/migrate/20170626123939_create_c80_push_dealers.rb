class CreateC80PushDealers < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_dealers do |t|
      t.integer :ord, null: false, default: 0
      t.string :title, null: false, limit: 90
      t.string :site
      t.string :email
      t.timestamps null: false
    end
  end
end
