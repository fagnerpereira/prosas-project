class Project < ApplicationRecord
  has_many :evaluations, dependent: :destroy
  has_many :grades, through: :evaluations

  accepts_nested_attributes_for :evaluations

  def update_total_average
    update(total_average: calculate_total_average)
  end

  def calculate_total_average
    evaluations.average(:weighted_average) || 0
  end
end
