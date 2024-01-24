require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
    @criterion_1 = criterions(:one)
  end

  test "#calculate_weighted_average" do
    @evaluation = Evaluation.create(project: @project)
    @evaluation.grades.create(value: 10, criterion: @criterion_1)
    @evaluation.grades.create(value: 20, criterion: @criterion_1)
    @evaluation.grades.create(value: 30, criterion: @criterion_1)

    weight = @criterion_1.weight
    expected_weighted_average = 10 * weight + 20 * weight + 30 * weight

    assert @evaluation.calculate_weighted_average, expected_weighted_average
  end

  test "#calculate_weighted_average without grades" do
    @evaluation = Evaluation.create(project: @project)

    assert @evaluation.calculate_weighted_average.zero?
  end
end
