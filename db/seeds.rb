table_names = %w(notes advises)
table_names.each do |table_name|
  path = Rails.root.join('db/seeds', Rails.env, table_name + '.rb')
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
