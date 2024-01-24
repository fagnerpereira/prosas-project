class Evaluation < ApplicationRecord
  belongs_to :project
  has_many :grades, dependent: :destroy
  has_many :criterions, through: :grades

  accepts_nested_attributes_for :grades

# Ex: A Avaliacao v1 possui 5 notas 1,2,3,4,5 que pertencem aos critério 5,4,3,2,1 respectivamente então a media_ponderada é (1*5+2*4+3*3+4*2+5*1)/5+4+3+2+1 = 2.33.
  def calculate_weighted_average
    return 0 if grades.empty?

    criterions_total_weight = criterions.total_weight
    grades_total_value = grades.joins(:criterion).sum('grades.value * criterions.weight')
    grades_total_value / criterions_total_weight
  end

  def update_project_total_average
    Project.update_total_average(project: project)
  end
end
