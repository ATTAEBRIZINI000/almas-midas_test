FROM node:20.13.0-alpine3.18

WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY package.json package-lock.json ./

# Install exact dependency versions from lock file
RUN npm ci

# Copy the rest of the application
COPY . .

EXPOSE 5000

CMD ["npm", "start"]