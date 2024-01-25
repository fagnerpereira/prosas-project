class RecalculateCriterionEvaluationsJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    Rails.logger.info 'Criterion evaluations recalculated!'

    RecalculateCriterionProjectsJob.perform_later(job.arguments.first)
  end

  def perform(criterion_id)
    criterion = Criterion.find(criterion_id)
    criterion.evaluations.each(&:update_weight_average)
  end
end
