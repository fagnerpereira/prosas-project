class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.float :total_average, default: 0

      t.timestamps
    end
  end
end
