require "test_helper"

class UpdateProjectTest < ActionDispatch::IntegrationTest
	setup do
		@project = projects(:one)
		@evaluation = @project.evaluations.first
		@grade = @project.grades.first
		@criterion_1 = Criterion.create(weight: 0.1)
		@criterion_2 = Criterion.create(weight: 0.2)
	end

	test "update a project successfully" do
		params = {
			project: {
				id: @project.id,
				name: 'project updated',
				evaluations_attributes: [
					{
						id: @evaluation.id,
						grades_attributes: {
							id: @grade.id,
							criterion_id: @criterion_2.id
						}
					}
				]
			}
		}

		assert_no_difference ["Project.count", "Evaluation.count", "Grade.count"] do
    	post projects_url, params: params, as: :json

    	json_body = JSON.parse response.body

    	assert_includes json_body, 'evaluations'
    	assert_includes json_body['evaluations'][0], 'grades'
    	assert_equal @project.reload.name, 'project updated'
    	assert_equal @grade.reload.criterion_id, @criterion_2.id
    end
	end

	# test "update evaluation for different project" do
	# end

	# test "update grade for a different evaluation" do
	# end
end
