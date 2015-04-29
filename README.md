#It's all about stats!

"It's all about stats" is a web analysis platform that produces an end-to-end (UI, Service, DB) protype a company's url hits statistics. 

##Ember Frontend
  ###http://localhost:300
      home page with a link to see the data pulled in from the two specific api endpoints listed below

##API
An API is served via localhost://3000/api/v1 for all your payloads CRUD needs as long as an endpoint for a list of two specifically requested reports.

###http://localhost:3000/api/v1/top_urls
  - Report 1 produces a list of the top urls visited over the last 5 days sorted both by date and secondly by visit count
  {"2015-04-29":[
                  {"url":"https://www.apple.com","visits":29},
                  {"url":"http://developer.apple.com","visits":25},
                  {"url":"https://apple.com","visits":19},
                  {"url":"http://apple.com","visits":11}]}

###http://localhost:3000/api/v1/top_referrers 

 - Report 2 produces a list of the top urls visited over the last 5 days as well as each a list for each url of the urls they were referred by and their count. This is sorted by date, visit count of the url, and lastly count of the referred by
 {"2015-04-29":[
                {"url":"https://www.apple.com","visits":29},
                {"url":"http://developer.apple.com","visits":25},
                {"url":"https://apple.com","visits":19},
                {"url":"http://apple.com","visits":11}]}


### Getting Started


Clone this repo:

```
$ git clone git@github.com:KristaANelson/all_about_stats.git
```

Navigate into the directory:

```
$ bundle install
```

Setup the database:

```
$ rake db:setup
```

Start the server:

```
$ rails server
```

Visit http://locahost:3000 

