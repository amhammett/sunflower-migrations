sunflower-migrations
====================

migration tasks for the fictional company, SuncropFlowers

migrate-micro-site-files.yml
--------------------

migrate a micro-services. the term micro-services is an ambiguous term but in this context
is used to describe a self contained service that runs within or apart of a separate 
application. 

### how to run?

```bash
    go-migrate-micro-site-files.sh <server> <git-repo> <path>
```

where

| attribute | description                                     | example                             |
| --------- | ----------------------------------------------- | ----------------------------------- |
| server    | the server to deploy the micro-services         | amee.local                          |
| git-repo  | source git repo, in format of ssh:// or http:// | https://github.com/foo/bar.git      |
| path      | the path to deploy the micro-services           | /var/www/example.site/path/to/micro | 
| --------- | ----------------------------------------------- | ----------------------------------- |

### how does it work?

1. git-clone-repo
2. deploy-micro-services
3. clear-cache
4. verify-micro-services-deployment
  - (add random string value in step 1 or 2, check for string value)


update-site-maintenance.yml
----------------------------

we don't always have our site maintenance page available. update status via release that does 
not require an entire site migration.

ideally this would just use the above playbook but enable/disable is done via the database.
the action of changing the state will be done via sql.

### how to run?

```bash
    go-update-site-maintenance.sh <server> <enable|disable> <git-repo> <file>
```

### how does it work?

1. git-clone-repo
2. change-site-maintenance-state
3. clear-cache
4. verify-site-maintenance