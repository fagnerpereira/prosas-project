require "test_helper"

class CriterionTest < ActiveSupport::TestCase
  setup do
    @criterion_1 = criterions(:one)
    @criterion_2 = criterions(:two)
  end

  test "total_weight scope" do
    @criterion_1.update(weight: 1.0)
    @criterion_2.update(weight: 3.0)
    criterions = Criterion.where(id: [@criterion_1.id, @criterion_2.id])

    assert_equal criterions.total_weight, 4.0
  end
end
