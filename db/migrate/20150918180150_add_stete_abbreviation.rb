class AddSteteAbbreviation < ActiveRecord::Migration
  def change
    add_column :user_field_options, :abbreviation, :string
  end
end
