# Use Python 3.12 slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /

# Install system dependencies including PostgreSQL client, build tools, and dos2unix
RUN apt-get update && apt-get install -y \
    postgresql-client \
    libpq-dev \
    gcc \
    python3-dev \
    bash \
    && rm -rf /var/lib/apt/lists/*


COPY migrate.sh .

# Copy application code
RUN chmod +x migrate.sh

# Command to run the application
CMD ["/migrate.sh"]