# Jobs Scraper
## Purpose
Scrape consistently available information from online job postings. The focus will be on destinations/platforms oriented towards tech and developer positions (i.e., http://careers.stackoverflow.com, http://jobs.37signals.com/, etc.).
## Approach
_The script should allow/do the following:_
* navigate to index page (initial script will go to a specific site)
* ask for keyword terms (i.e., ruby, javascript, etc)
* execute search
* loop through the search results to store and/or visit each page
** scrape the desired data based on CSS tags

### Schema (table_name - field_1, field_2, ... )

*postings* - company_name, website, posting_url, title, location, description, email