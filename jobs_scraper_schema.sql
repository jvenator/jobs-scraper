DROP TABLE postings;

CREATE TABLE postings (
	id INTEGER PRIMARY KEY,
	posting_url TEXT,
	company TEXT,
	website TEXT,
	title TEXT,
	location TEXT,
	description TEXT,
	where_to_apply TEXT,
	posting_date TEXT
);