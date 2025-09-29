FROM n8nio/n8n:latest

USER root

# Install Python, pip, and build tools + system libraries
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    libffi-dev \
    musl-dev \
    openssl-dev \
    ca-certificates \
    bash \
    curl \
    git

# Copy your scraper folder
COPY ./forex_factory_calendar_news_scraper /home/n8n/forex_scraper

# Install Python dependencies WITHOUT upgrading pip
RUN pip3 install --no-cache-dir -r /home/n8n/forex_scraper/requirements.txt

# Switch back to n8n user
USER node
