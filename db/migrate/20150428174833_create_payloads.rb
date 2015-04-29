class CreatePayloads < ActiveRecord::Migration
  def change
    create_table :payloads do |t|
      t.string :url
      t.string :referrer
      t.string :payload_hash

      t.timestamps null: false
    end
  end
end
