class UpdateNullableOnPayloads < ActiveRecord::Migration
  def change
    change_column_null(:payloads, :url, false)
    change_column_null(:payloads, :referrer, true)
  end
end
