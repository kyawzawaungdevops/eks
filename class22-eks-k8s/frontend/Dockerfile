FROM node:20-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install
RUN npm install @tailwindcss/forms

COPY . .

RUN npm run build

FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install production dependencies only
RUN npm install express http-proxy-middleware

COPY --from=build /app/build ./build

COPY server.js .

CMD ["node", "server.js"]



