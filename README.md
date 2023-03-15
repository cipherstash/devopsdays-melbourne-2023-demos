## Data science demo

Ensure you have:

- Postgres installed
- [the Rails demo](https://github.com/cipherstash/cipherstash-rails-demo-app) running with Postgres on 5432
  - You must also have run an `stash upload-config` for the Rails demo
- CipherStash-enabled psql on your path (something like `alias stash-psql='/path/to/github.com/cipherstash/driver/pq-ext/ext/build/bin/psql'`
- The `CS_CLIENT_ID` and `CS_CLIENT_KEY` exported (best to manage this with direnv and a `.envrc`)

Then:

``` bash
# set up the database
make init

# start the database server
make start
```

To do the backup and restore:

``` bash
# backup from postgres on 5432 (Rails)
make backup

# restore to postgres on 5433
make restore
```

Tail the log:

``` bash
tail -F ~/.cipherstash/*/decryptions.log
```

Then query the data:

``` bash
stash-psql -p 5433 rails_demo
#> SELECT full_name, dob FROM patients LIMIT 5;
```

To reset the demo:

```
# shut down the database
make stop

# reset the database
make clean
```
