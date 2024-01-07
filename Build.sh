# Build Jenkins image
docker build -t my-jenkins .

# Build PostgreSQL image
docker build -t my-postgres -f Dockerfile.postgres .
