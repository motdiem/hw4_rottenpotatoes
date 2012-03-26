Given /^the following (.+) exist:$/ do |items, table|
  table.hashes.each do |hash|
  klass = items.classify.constantize
  klass.create!(hash)
  end
  end



Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
 page.should have_content("Details about Alien")
 page.should have_content("Ridley Scott")
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #assert false, "Unimplmemented"
  assert page.body.index(e1) < page.body.index(e2)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').collect{|r| "ratings_" + r.strip}.each{|rating|
    if uncheck then uncheck(rating) else check(rating) end
  }
end

Then /I should see (.*) of the movies/ do |all_or_none|
 case all_or_none
 when 'all'
  page.has_css?("tbody tr", :count => Movie.all.count)
 when 'none'
  not page.has_css?("tbody tr")
 else
  assert false, "Unimplemented"
 end
end

