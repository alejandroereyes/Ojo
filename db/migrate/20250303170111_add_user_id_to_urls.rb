class AddUserIdToUrls < ActiveRecord::Migration[8.0]
  def change
    add_reference :urls, :user, type: :uuid, null: false, foreign_key: true, index: true
  end
end
