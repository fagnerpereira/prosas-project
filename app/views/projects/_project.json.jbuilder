json.extract! project, :id, :name, :total_average, :created_at, :updated_at
json.evaluations do
	json.array! project.evaluations, partial: "evaluations/evaluation", as: :evaluation
end
json.url project_url(project, format: :json)
