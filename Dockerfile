# Use official n8n image
FROM n8nio/n8n:latest

USER root

# Install Python, pip, and build tools
RUN apk add --no-cache python3 py3-pip build-base libffi-dev

# Copy your scraper folder
COPY ./forex_factory_calendar_news_scraper /home/n8n/forex_scraper

# Upgrade pip
RUN pip3 install --upgrade pip

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /home/n8n/forex_scraper/requirements.txt

# Switch back to n8n user
USER node
