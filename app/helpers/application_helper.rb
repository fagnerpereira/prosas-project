module ApplicationHelper
  include Pagy::Frontend

  def evaluation_title(evaluation)
    t('.evaluation_title', weighted_average: evaluation.weighted_average.round(2),
                           created_at: l(evaluation.created_at))
  end

  def current_tab?(current_path)
    'text-primary-500' if current_path == request.path
  end
end
