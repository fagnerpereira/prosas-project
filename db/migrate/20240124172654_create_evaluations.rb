class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.float :weighted_average, default: 0
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
