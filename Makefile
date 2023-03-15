pgdata := /Users/auxesis/src/github.com/cipherstash/demos/data-science/pgdata

all: serve

init:
	mkdir -p $(pgdata)
	initdb --pgdata $(pgdata)

start:
	pg_ctl start --pgdata $(pgdata) --options="-p 5433"

stop:
	pg_ctl stop --pgdata $(pgdata) --options="-p 5433"

backup:
	pg_dumpall --file=backup.sql --port=5432

restore:
	createdb -p 5433 auxesis
	psql -p 5433 < backup.sql

clean:
	rm -rf $(pgdata)
