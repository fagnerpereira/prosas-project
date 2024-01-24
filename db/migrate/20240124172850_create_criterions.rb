class CreateCriterions < ActiveRecord::Migration[7.1]
  def change
    create_table :criterions do |t|
      t.float :weight
      t.string :name

      t.timestamps
    end
  end
end
