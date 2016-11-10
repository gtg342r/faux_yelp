class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :ratings,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
