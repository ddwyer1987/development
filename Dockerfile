FROM ubuntu:bionic

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        curl \
        unzip \
        wget \
        software-properties-common \
        gpg \
        git

# Install Terraform
RUN apt install consul

# Install AWS CLI
RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Install Python
RUN apt-get install -y python3 python3-pip

# Cleanup
RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD tail -f /dev/null
