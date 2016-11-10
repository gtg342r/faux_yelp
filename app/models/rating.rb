class Rating < ApplicationRecord
  # Direct associations

  belongs_to :restaurant,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
