class PopulateAlberta < ActiveRecord::Migration
  def up
    province = UserField.find_by(name: 'Province/State')
    city     = UserField.find_by(name: 'City')

    british  = UserFieldOption.find_by(value: 'British Columbia')
    british.update(abbreviation: 'BC')

    alberta  = UserFieldOption.create(user_field_id: province.id, value: 'Alberta', abbreviation: 'AB')

    UserFieldOption.create(user_field_id: city.id, value: 'Airdrie', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Brooks', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Calgary', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Camrose', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Chestermere', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Cold Lake', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Edmonton', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Fort Saskatchewan', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Grande Prairie', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Lacombe', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Leduc', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Lethbridge', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Lloydminster', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Medicine Hat', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Red Deer', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Spruce Grove', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'St. Albert', parent_field_option_id: alberta.id)
    UserFieldOption.create(user_field_id: city.id, value: 'Wetaskiwin', parent_field_option_id: alberta.id)
  end

  def down
  end
end
