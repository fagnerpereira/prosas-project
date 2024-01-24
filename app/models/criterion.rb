class Criterion < ApplicationRecord
	scope :total_weight, -> { sum(:weight) }
end
