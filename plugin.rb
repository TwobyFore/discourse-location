# name: discourse-location
# about: adds dropdown's to select location
# authors: Vairix
Discourse::Application.routes.prepend do
  get "/cities_by_state" => "custom_user_preferences#cities_by_state"
  get "/neighborhood_by_city" => "custom_user_preferences#neighborhood_by_city"
end

after_initialize do
  load File.expand_path("../models/extended_user_field_option.rb", __FILE__)
  load File.expand_path("../controllers/custom_user_preferences_controller.rb", __FILE__)
end
