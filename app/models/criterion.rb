class Criterion < ApplicationRecord
	scope :total_weight, -> { sum(:weight) }

	validates_presence_of :name, :weight
	validates_uniqueness_of :weight, scope: :name
end
