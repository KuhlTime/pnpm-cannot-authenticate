FROM node:18-alpine

# Load environment variables
ARG NPM_TOKEN

RUN echo $NPM_TOKEN

# Select working directory
WORKDIR /usr/src/app

# Install pnpm
RUN apk add --no-cache curl \
  && curl -sL https://unpkg.com/@pnpm/self-installer | node

COPY package.json pnpm-lock.yaml ./
COPY .npmrc .npmrc

RUN pnpm install --frozen-lockfile

# Copy files
COPY . .

# Run application
CMD pnpm start