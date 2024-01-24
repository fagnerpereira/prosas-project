require "test_helper"

class CreateProjectsTest < ActionDispatch::IntegrationTest
	setup do
		@criterion = criterions(:one)
	end

	test "update valid criterion" do
		params = {
			criterion: {
				id: @criterion.id,
				name: 'criterion updated',
				weight: 0.5
			}
		}

		assert_no_difference "Criterion.count" do
			post criterions_url, params: params, as: :json

			json_body = JSON.parse response.body

			assert_equal json_body['name'], params[:criterion][:name]
			assert_equal json_body['weight'], params[:criterion][:weight]
		end
	end
end
