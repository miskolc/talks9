class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :project_id
      t.string :status

      t.timestamps
    end
  end
end
