json.extract! evaluation, :id, :weighted_average, :project_id, :created_at, :updated_at
json.grades do
	json.array! evaluation.grades, partial: "grades/grade", as: :grade
end
json.url evaluation_url(evaluation, format: :json)
