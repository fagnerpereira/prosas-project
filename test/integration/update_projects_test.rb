require "test_helper"

class UpdateProjectTest < ActionDispatch::IntegrationTest
	setup do
		@project_1 = projects(:one)
		@project_2 = projects(:two)
		@evaluation_1 = @project_1.evaluations.first
		@evaluation_2 = @project_2.evaluations.first
		@grade = @project_1.grades.first
		@criterion_1 = Criterion.create(weight: 0.1)
		@criterion_2 = Criterion.create(weight: 0.2)
	end

	test "update a project successfully" do
		params = {
			project: {
				id: @project_1.id,
				name: 'project updated',
				evaluations_attributes: [
					{
						id: @evaluation_1.id,
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
    	assert_equal @project_1.reload.name, 'project updated'
    	assert_equal @grade.reload.criterion_id, @criterion_2.id
    end
	end

	test "update evaluation for different project" do
		params = {
			project: {
				id: @project_1.id,
				name: 'project updated',
				evaluations_attributes: [
					{
						id: @evaluation_2.id,
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

    	assert_includes json_body, 'error'
    	assert_not_equal @project_1.reload.name, 'project updated'
    	assert_not_equal @grade.reload.criterion_id, @criterion_2.id
    end
	end
end
