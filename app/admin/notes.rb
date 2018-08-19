ActiveAdmin.register Note do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :latitude, :longitude, :crime_category, :address_city_part, :address_country_part, :address, :situation, :occured_at, :occured_at_date_part, :occured_at_time_part, :embassy, :source_url, :profile_sex, :profile_age, :profile_type, :profile_supplement

end
