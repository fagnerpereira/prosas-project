class RecalculateCriterionProjectsJob < ApplicationJob
  queue_as :default

  def perform(criterion_id)
    Rails.logger.info "Recalculating projects total average for criterion #{criterion_id}"

    criterion = Criterion.find(criterion_id)
    criterion.projects.each(&:update_total_average)

    Rails.logger.info 'Projects total average recalculated!'
  end
end
