FactoryGirl.define do
  factory :person, class: Contacts::Person do
    user
    first_name 'Joe'
    last_name 'Blow'
    email { "#{first_name}.#{last_name}@example.com".downcase }
  end
end
