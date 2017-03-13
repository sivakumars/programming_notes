require "sequel"

DB = Sequel.connect('postgres://localhost/sequel-single-table')

items = DB[:menu_items]

results = items.select do
  labor_calc = prep_time*12.0/60.0

  [ item,
    menu_price,
    ingredient_cost,
    (labor_calc).as(labor),
    (menu_price-ingredient_cost-labor_calc).as(profit)
  ]
end

results.each do |result|
  puts result[:item]
  puts "menu price: #{sprintf('$%0.2f', result[:menu_price])}"
  puts "ingredient cost: #{sprintf('$%0.2f', result[:ingredient_cost])}"
  puts "labor: #{sprintf('$%0.2f', result[:labor])}"
  puts "profit: #{sprintf('$%0.2f', result[:profit])}"
  puts
end
