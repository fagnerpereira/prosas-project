class Evaluation < ApplicationRecord
  belongs_to :project
  has_many :grades, dependent: :destroy
  has_many :criterions, through: :grades

  accepts_nested_attributes_for :grades

  def update_weight_average
    self.weighted_average = calculate_weighted_average
    save
  end

  def calculate_weighted_average
    return 0 if grades.empty?

    criterions_total_weight = criterions.total_weight
    grades_total_value = grades.joins(:criterion).sum('grades.value * criterions.weight')
    grades_total_value / criterions_total_weight
  end

  def update_project_total_average
    Project.update_total_average(project:)
  end
end
