class Project < ApplicationRecord
  has_many :evaluations, dependent: :destroy

  accepts_nested_attributes_for :evaluations

  def self.update_total_average(project:)
    project_total_average = project.calculate_total_average
    project.update(total_average: project_total_average)
  end

  def calculate_total_average
    evaluations.average(:weighted_average) || 0
  end
end
