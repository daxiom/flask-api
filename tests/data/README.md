### Test data files

Files that end in `.sql` are autoloaded at the start of the test cycle.
The files are loaded in alphbetical order.

The default flow is:
- creates the database,
- upgrades the database to the latest schema
- loads the *.sql files in alpha descending order



pg_dump --host localhost --port 4444 --username postgres --format plain --verbose --file users.sql --table public.users lear
