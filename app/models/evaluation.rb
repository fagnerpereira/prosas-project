class Evaluation < ApplicationRecord
  belongs_to :project
  has_many :grades, dependent: :destroy
end
