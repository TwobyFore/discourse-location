UserFieldOption.class_eval do
  belongs_to :parent_field_option, class_name: "UserFieldOption"
end
