FROM n8nio/n8n:latest-buster

USER root

# Install Python and pip (Debian-based)
RUN apt-get update && apt-get install -y python3 python3-pip build-essential libffi-dev libssl-dev

# Copy scraper folder
COPY ./forex_factory_calendar_news_scraper /home/n8n/forex_scraper

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /home/n8n/forex_scraper/requirements.txt

USER node
