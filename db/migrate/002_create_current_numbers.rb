class CreateCurrentNumbers < ActiveRecord::Migration
  def change
    create_table :current_numbers do |t|
      t.integer :custom_field_id
      t.integer :project_id
      t.integer :tracker_id
      t.integer :current_number
    end
  end
end
