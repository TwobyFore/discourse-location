Admin::UserFieldsController.class_eval do

  def update
    field_params = params[:user_field]
    field = UserField.where(id: params.require(:id)).first

    Admin::UserFieldsController.columns.each do |col|
      unless field_params[col].nil?
        field.send("#{col}=", field_params[col])
      end
    end
    update_options(field)

    if field.save
      render_serialized(field, UserFieldSerializer, root: 'user_field')
    else
      render_json_error(field)
    end
  end

  protected

    def update_options(field)
      options = params[:user_field][:options]
      new_options = []
      if options.present?
        user_field_options = UserFieldOption.where(user_field_id: field.id)
        new_options = user_field_options.map do |ufo|
          unless options.any? { |o| o == ufo.value }
            ufo.delete
            nil
          else
            { id: ufo.id, value: ufo.value, parent_field_option_id: ufo.parent_field_option_id, abbreviation: ufo.abbreviation }
          end
        end
        new_options += options.map { |o| { value: o } if user_field_options.where(value: o).empty? }
        field.user_field_options_attributes = new_options.compact
      end
    end
end
