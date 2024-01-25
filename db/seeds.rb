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

# Creating Criteria
criterion_1 = Criterion.find_or_create_by!(name: 'c1', weight: 1)
criterion_2 = Criterion.find_or_create_by!(name: 'c2', weight: 2)
criterion_3 = Criterion.find_or_create_by!(name: 'c3', weight: 3)
criterion_4 = Criterion.find_or_create_by!(name: 'c4', weight: 4)
criterion_5 = Criterion.find_or_create_by!(name: 'c5', weight: 5)

# Creating Projects
1000.times do |i|
  puts "creating project #{i + 1}"

  project = Project.find_or_create_by!(name: "Project #{i + 1}")
  evaluation = Evaluation.find_or_create_by!(project: project)
  evaluation.grades.create!(criterion: criterion_1, value: 1)
  evaluation.grades.create!(criterion: criterion_2, value: 2)
  evaluation.grades.create!(criterion: criterion_3, value: 3)
  evaluation.grades.create!(criterion: criterion_4, value: 4)
  evaluation.grades.create!(criterion: criterion_5, value: 5)
end

puts 'Seed data created successfully.'
