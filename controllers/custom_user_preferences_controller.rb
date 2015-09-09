class CustomUserPreferencesController < ApplicationController

  def cities_by_state
    result = { locations: [] }
    state = UserField.find_by(name: 'Province/State')
    ufo = UserFieldOption.where(value: params[:state], user_field_id: state.id).first
    UserFieldOption.where(parent_field_option_id: ufo.id).each do |option|
      result[:locations] << { name: option.value, value: option.id }
    end
    render json: result
  end

  def neighborhood_by_city
    result = { locations: [] }
    state = UserField.find_by(name: 'City')
    ufo = UserFieldOption.where(value: params[:city], user_field_id: state.id).first
    UserFieldOption.where(parent_field_option_id: ufo.id).each do |option|
      result[:locations] << { name: option.value, value: option.id }
    end
    render json: result
  end

end
