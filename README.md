sunflower-migrations
====================

migration tasks for the fictional company, SuncropFlowers

migrate-micro-site-files.yml
--------------------

migrate a microservices. the term microservices is an ambiguous term but in this context
is used to describe a self contained service that runs within or apart of a separate 
application. 

### how to run?

### how does it work?

1. git clone repo
2. backup target (optional)
3. copy to target
4. clear cache
5. test (add random string value in step 1 or 2, check for string value)


enable-site-maintenance.yml
----------------------------

we don't always have our site maintenance page available. enable via release that does 
not require an entire site migration.

ideally this would just use the above playbook but enable/disable is done via the database.
the action of changing the state will be done via sql.

### how to run?

### how does it work?

1. git clone repo
2. execute sql
3. clear cache
4. test