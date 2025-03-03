class CreateUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :urls, id: :uuid do |t|
      t.text :short_code, null: false
      t.text :original_url, null: false
      t.datetime :expires_at

      t.timestamps

      t.index ["short_code"], unique: true
    end
  end
end
