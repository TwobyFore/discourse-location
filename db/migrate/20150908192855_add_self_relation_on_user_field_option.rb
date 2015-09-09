class AddSelfRelationOnUserFieldOption < ActiveRecord::Migration
  def change
    add_column :user_field_options, :parent_field_option_id, :integer
  end
end
