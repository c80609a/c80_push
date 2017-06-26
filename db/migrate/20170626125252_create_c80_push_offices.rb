class CreateC80PushOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :c80_push_offices do |t|
      t.string :ord, null: false, default: 0
      t.string :title, null: false
      t.string :addr, null: false
      t.string :gps, null: false
      t.string :tel, null: false
      t.string :email
      t.string :site
      t.references :dealer, index: true

      t.timestamps null: false
    end
  end
end
