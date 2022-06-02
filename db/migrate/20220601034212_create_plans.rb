class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :title
      t.datetime :start
      t.datetime :finish
      t.boolean :checkbox
      t.string :comment

      t.timestamps
    end
  end
end
