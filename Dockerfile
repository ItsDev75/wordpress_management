# Use the official PostgreSQL image
FROM postgres:latest

# Set environment variables
ENV POSTGRES_USER=devsaini
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=mohit

# Copy the entrypoint script
#COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Make the entrypoint script executable
#RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Expose the default PostgreSQL port
EXPOSE 5436
