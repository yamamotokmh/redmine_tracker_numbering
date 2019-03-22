class AddZeroPaddingSizeToCustomFields < ActiveRecord::Migration
  def up
    add_column :custom_fields, :zero_padding_size, :integer
  end

  def down
    remove_column :custom_fields, :zero_padding_size
  end
end