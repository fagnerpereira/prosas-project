require 'test_helper'

class CriterionTest < ActiveSupport::TestCase
  setup do
    @project = Project.create(name: 'project test')
    @criterion_1 = Criterion.create(name: 'c4', weight: 0.1)
    @criterion_2 = Criterion.create(name: 'c5', weight: 4.2)
    @evaluation = @project.evaluations.create
    @evaluation.grades.create(criterion: @criterion_1, value: 1.0)
    @evaluation.grades.create(criterion: @criterion_2, value: 1.0)
  end

  test 'update criterion weight' do
    assert_equal 1.0, @evaluation.weighted_average
    assert_equal 1.0, @project.total_average

    @criterion_1.update(weight: 0.5)

    #  (1.0 * @criterion.weight + 1.0 * @criterion.weight + 1.0 * @criterion.weight) / @evaluation.criterions.total_weight
    assert_equal 1.0, @evaluation.weighted_average
    assert_equal 1.0, @project.total_average
  end

  test 'total_weight scope' do
    criterions(:one).update(weight: 1.0)
    criterions(:two).update(weight: 3.0)
    criterions = Criterion.where(id: [criterions(:one).id, criterions(:two).id])

    assert_equal criterions.total_weight, 4.0
  end
end
