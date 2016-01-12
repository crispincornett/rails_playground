User.seed(:email) do |user|
  user.email                 = 'nobody@example.com'
  user.password              = 'password123'
  user.password_confirmation = 'password123'
  user.client                = Client.find_or_create_by(short_name: 'acme')
end

User.seed(:email) do |user|
  user.email                 = 'admin@example.com'
  user.password              = 'admin1234'
  user.password_confirmation = 'admin1234'
  user.client                = Client.find_or_create_by(short_name: 'acme')
end

User.seed(:email) do |user|
  user.email                 = 'superadmin@example.com'
  user.password              = 'superadmin'
  user.password_confirmation = 'superadmin'
  user.client                = Client.find_or_create_by(short_name: 'acme')
  user.super_admin           = true
end