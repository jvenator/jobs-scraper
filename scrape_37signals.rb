require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'

# @db = SQLite3::Database.open('jobs_scraper_schema.sql')

def escape(text)
  text = '' if text.nil?
  text = text.dup
  text = text.to_s
  text.gsub!("'", "''")
  text.gsub!('"', '""')
  text.strip!
  text
end

root_url = "http://jobs.37signals.com"

puts "Enter keywords for your job search (no commas)"
keywords = gets.chomp.split(" ").join("+")

search_url = root_url + "/jobs/search?term=" + keywords

search_results = Nokogiri::HTML(open(search_url))
result_records = search_results.css("div#category-2 li a")
result_records.each do |r|
	unless r == result_records.last
		posting_url = root_url+r["href"]
		puts posting_url

		company = r.css("span.company").inner_text
		puts company

		location = r.css("span.city").inner_text
		puts location

		title = r.css("span.title").inner_text
		puts title

		posting_date = r.css("span.date").inner_text+", "+DateTime.now.year.to_s
		puts posting_date

		listing = Nokogiri::HTML(open(posting_url))

		description = listing.css("div.listing-container").inner_text
		puts description

		where_to_apply = 
		if listing.css("div.apply a")[0]["href"].start_with?("mailto:")
			"mailto:"+listing.css("div.apply a")[0].inner_text
		puts where_to_apply
		puts "-------------------------------"
	end
end
