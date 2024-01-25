require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  setup do
    @project = Project.create(name: 'project test')
    @criterion = Criterion.create(name: 'c5', weight: 0.5)
    @evaluation = @project.evaluations.create
    @evaluation.grades.create(criterion: @criterion, value: 1.0)
    @evaluation.grades.create(criterion: @criterion, value: 1.0)
  end

  test 'create a grade value' do
    assert_equal 1.0, @evaluation.weighted_average
    assert_equal 1.0, @project.total_average

    @evaluation.grades.create(criterion: @criterion, value: 1.0)

    #  (1.0 * @criterion.weight + 1.0 * @criterion.weight + 1.0 * @criterion.weight) / @evaluation.criterions.total_weight
    assert_equal 1.0, @evaluation.weighted_average
    assert_equal 1.0, @project.total_average
  end

  test 'update a grade value' do
    assert_equal 1.0, @evaluation.weighted_average
    assert_equal 1.0, @project.total_average

    @evaluation.grades.first.update(value: 5.0)

    #  (5.0 * @criterion.weight + 1.0 * @criterion.weight) / @evaluation.criterions.total_weight
    assert_equal 3.0, @evaluation.weighted_average
    assert_equal 3.0, @project.total_average
  end
end
