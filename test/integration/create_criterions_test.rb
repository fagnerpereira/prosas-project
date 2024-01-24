require "test_helper"

class CreateProjectsTest < ActionDispatch::IntegrationTest
	setup do
		@criterion = criterions(:one)
	end

	test "create valid criterion" do
		params = {
			criterion: {
				name: 'criterion 1',
				weight: 0.1
			}
		}

		assert_difference "Criterion.count" do
			post criterions_url, params: params, as: :json

			json_body = JSON.parse response.body

			assert_equal json_body['name'], params[:criterion][:name]
			assert_equal json_body['weight'], params[:criterion][:weight]
		end
	end

	test "create valid criterion with existing weight" do
		params = {
			criterion: {
				name: 'criterion 123',
				weight: @criterion.weight
			}
		}

		assert_difference "Criterion.count" do
			post criterions_url, params: params, as: :json

			json_body = JSON.parse response.body

			assert_equal json_body['name'], params[:criterion][:name]
			assert_equal json_body['weight'], params[:criterion][:weight]
		end
	end

	test "create invalid criterion" do
		params = {
			criterion: {
				name: @criterion.name,
				weight: @criterion.weight
			}
		}

		assert_no_difference "Criterion.count" do
			post criterions_url, params: params, as: :json

			assert_equal response.status, 422
		end
	end
end
