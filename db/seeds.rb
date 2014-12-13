# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

QuestionType.create([{name: "Freitext"}, {name: "Ja/Nein"}, {name: "Multiple choice"}])
roles = Role.create([{name: "Superuser"}, {name: "Teilnehmer"}, {name: "Admin"}])

addresses = Address.create([{street:"mystreet 1", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 2", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 3", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 4", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 5", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 6", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 7", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 8", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 9", city: "Hamburg", city_code: 234234, country: "Germany"},
                           {street:"mystreet 10", city: "Hamburg", city_code: 234234, country: "Germany"},]
)
organizations = Organization.create([{name: "Medicore", address: addresses[0]}, {name: "Company1", address: addresses[1]}])

User.create([{first_name: "Andreas", last_name: "Heumaier", role_id: roles[0].id, address: addresses[2], organization_id: organizations[0].id},
					  {first_name: "Christoph", last_name: "Klaja", role_id: roles[1].id, address: addresses[3], organization_id: organizations[0].id},
					  {first_name: "Admin", last_name: "User", role_id: roles[2].id, address: addresses[4], organization_id: organizations[1].id},
            {first_name: "Trial1", last_name: "User", role_id: roles[1].id, address: addresses[4], organization_id: nil},
            {first_name: "Tria2l", last_name: "User", role_id: roles[1].id, address: addresses[6], organization_id: nil},
            {first_name: "Trial3", last_name: "User", role_id: roles[1].id, address: addresses[7], organization_id: nil},
            {first_name: "Trial4", last_name: "User", role_id: roles[1].id, address: addresses[8], organization_id: nil},
					  {first_name: "Trial5", last_name: "User", role_id: roles[1].id, address: addresses[9], organization_id: nil}]
					)
100.times do |count|
  Question.create(:question => "How much is #{count}")
end

Trial.create([{name: "trial 1", description: "This is a trials description which schould be some longer than other things", summary: "This is a summary", organization_id: organizations[1].id },
              {name: "trial 2", description: "This is a trials description which schould be some longer than other things", summary: "This is a summary", organization_id: organizations[1].id},
              {name: "trial 3", description: "This is a trials description which schould be some longer than other things", summary: "This is a summary", organization_id: organizations[1].id},
              {name: "trial 4", description: "This is a trials description which schould be some longer than other things", summary: "This is a summary", organization_id: organizations[1].id},
              {name: "trial 5", description: "This is a trials description which schould be some longer than other things", summary: "This is a summary", organization_id: organizations[1].id},
              {name: "trial 6", description: "This is a trials description which schould be some longer than other things", summary: "This is a summary", organization_id: organizations[1].id},
              {name: "trial 7", description: "This is a trials description which schould be some longer than other things", summary: "This is a summary", organization_id: organizations[1].id}])





 10.times do |trial|
   Trial.create(:name => trial, :description => 'this is a longer trial description',:summary => 'This is a summary', :organization_id => organizations[1])
 end
