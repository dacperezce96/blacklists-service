if [ "$DB_USER" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $DB_HOST $DB_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python manage.py create_db
python manage.py run -h 0.0.0.0 -p 3000

exec "$@"