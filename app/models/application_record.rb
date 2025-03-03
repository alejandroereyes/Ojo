class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  self.primary_key = :uuid
end
