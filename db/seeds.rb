# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Creating Projects
project_1 = Project.find_or_create_by!(name: 'Project 1', total_average: 85.5)
project_2 = Project.find_or_create_by!(name: 'Project 2', total_average: 90)

# Creating Criteria
criterion_1 = Criterion.find_or_create_by!(name: 'c1', weight: 0.1)
criterion_2 = Criterion.find_or_create_by!(name: 'c2', weight: 0.2)
criterion_3 = Criterion.find_or_create_by!(name: 'c3', weight: 0.3)
criterion_4 = Criterion.find_or_create_by!(name: 'c4', weight: 0.4)
criterion_5 = Criterion.find_or_create_by!(name: 'c5', weight: 0.5)

# Creating Evaluations
evaluation_1 = Evaluation.find_or_create_by!(weighted_average: 88.5, project: project_1)
evaluation_2 = Evaluation.find_or_create_by!(weighted_average: 92.0, project: project_2)

# Creating Grades
grade_1 = Grade.find_or_create_by!(value: 95.0, evaluation: evaluation_1, criterion: criterion_1)
grade_2 = Grade.find_or_create_by!(value: 95.0, evaluation: evaluation_1, criterion: criterion_2)
grade_3 = Grade.find_or_create_by!(value: 95.0, evaluation: evaluation_1, criterion: criterion_3)

puts 'Seed data created successfully.'
