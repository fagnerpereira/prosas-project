require "test_helper"

class CreateProjectTest < ActionDispatch::IntegrationTest
	setup do
		@criterion_1 = Criterion.create(weight: 0.1)
		@criterion_2 = Criterion.create(weight: 0.2)
	end

	# O endpoint 1 deve receber um corpo de requisição onde seja possível cadastrar ou atualizar 1 projeto com N avaliações onde cada avaliação tem N notas pertencentes a N critérios.
	test "create a project successfully" do
		params = {
			project: {
				name: 'project 1',
				evaluations_attributes: [
					{
						grades_attributes: [
							{ value: 10, criterion_id: @criterion_1.id },
							{ value: 20, criterion_id: @criterion_1.id },
							{ value: 30, criterion_id: @criterion_1.id }
						]
					}
				]
			}
		}

		assert_difference ["Project.count", "Evaluation.count"] do
			assert_difference "Grade.count", 3 do
      	post projects_url, params: params, as: :json
      end
    end
	end
end
