require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
  end

  test "#calculate_total_average" do
    @project.evaluations.create(weighted_average: 1.0)
    @project.evaluations.create(weighted_average: 2.0)
    @project.evaluations.create(weighted_average: 3.0)

    expected_total_average = @project.evaluations.sum(:weighted_average) / @project.evaluations.size

    assert_equal @project.calculate_total_average, expected_total_average
  end

  test "#calculate_total_average without evaluations" do
    @project.evaluations.destroy_all

    assert @project.calculate_total_average.zero?
  end
end
