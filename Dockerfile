# Use the official n8n image
FROM n8nio/n8n:latest

# Install Python and pip (Alpine Linux version)
USER root
RUN apk add --no-cache python3 py3-pip

# Copy your scraper folder into the container
COPY ./forex_factory_calendar_news_scraper /home/n8n/forex_scraper

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /home/n8n/forex_scraper/requirements.txt

# Switch back to n8n user
USER node
