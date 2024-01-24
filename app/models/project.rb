class Project < ApplicationRecord
  has_many :evaluations, dependent: :destroy
end
