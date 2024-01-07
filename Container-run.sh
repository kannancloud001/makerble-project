# Run Jenkins container
docker run -d -p 8080:8080 --name jenkins-container my-jenkins

# Run PostgreSQL container
docker run -d -p 5432:5432 --name postgres-container my-postgres
