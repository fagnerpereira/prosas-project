class Criterion < ApplicationRecord
  scope :total_weight, -> { sum(:weight) }

  has_many :grades, dependent: :nullify
  has_many :evaluations, through: :grades
  has_many :projects, through: :evaluations

  validates_presence_of :name, :weight
  validates_uniqueness_of :weight, scope: :name

  after_update_commit :update_evaluations_weighted_average

  def update_evaluations_weighted_average
    RecalculateCriterionEvaluationsJob.perform_later(id) if weight_previously_changed?
  end
end
