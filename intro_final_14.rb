contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
types = [:email, :address, :phone]

contacts.each do |key,value|
  types.each do |type|
    contacts[key][type] = contact_data.first.shift
  end
  if contact_data.length > 1 then contact_data.shift end
end

puts contacts
