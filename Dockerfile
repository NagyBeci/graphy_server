# Use a more secure and updated base image, if available.
# It's important to choose a version that doesn't have the zlib vulnerability.
FROM node:21.7.0-bookworm-slim

# Copy necessary files
COPY graphserver.js .
COPY package.json .
COPY UScities.json .

# Ensure all packages are up-to-date. 
# This might include security patches for other vulnerabilities.
# We're using 'apt-get' instead of 'apk' as it is more standard with Debian-based images
RUN apt-get update && \
    apt-get upgrade -y && \
    npm install

# Expose the port your application runs on
EXPOSE 4000

# Start your application
CMD ["node", "graphserver.js"]
