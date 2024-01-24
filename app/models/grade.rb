class Grade < ApplicationRecord
  belongs_to :evaluation
  belongs_to :criterion

  after_commit :update_evaluation_weight_average

  def update_evaluation_weight_average
    evaluation.update_weight_average
  end
end
