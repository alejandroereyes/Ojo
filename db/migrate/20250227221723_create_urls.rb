class CreateUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :urls, id: :uuid do |t|
      t.text :short_url, null: false
      t.text :original_url, null: false
      t.datetime :expires_at
      
      t.timestamps

      t.index ["short_url"], name: 'idx_urls_on_short_url', unique: true
    end
  end
end
