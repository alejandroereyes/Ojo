class Url < ApplicationRecord
  belongs_to :user

  validates :original_url, presence: true
  validates :short_code, presence: true

  broadcasts_to ->(url) { :urls }
end
