class Criterion < ApplicationRecord
  scope :total_weight, -> { sum(:weight) }

  has_many :grades

  validates_presence_of :name, :weight
  validates_uniqueness_of :weight, scope: :name

  after_commit :update_evaluations_weighted_average

  def update_evaluations_weighted_average
    grades.each do |grade|
      grade.update_evaluation_weight_average
    end
  end
end
