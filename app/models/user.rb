class User < ApplicationRecord
  has_secure_password
has_many :activities
has_many :meals
validates :morphology, inclusion: { in: %w[ectomorphe mésomorphe endomorphe], allow_blank: true }

end
