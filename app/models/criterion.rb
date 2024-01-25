class Criterion < ApplicationRecord
  scope :total_weight, -> { sum(:weight) }

  has_many :grades
  has_many :evaluations, through: :grades

  validates_presence_of :name, :weight
  validates_uniqueness_of :weight, scope: :name

  after_commit :update_evaluations_weighted_average, on: :update

  def update_evaluations_weighted_average
    evaluations.each(&:update_weight_average)
  end
end
