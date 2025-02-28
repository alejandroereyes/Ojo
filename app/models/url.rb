class Url < ApplicationRecord

  broadcasts_to -> (url) { :urls }

end