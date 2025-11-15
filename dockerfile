# Use base image with Node.js
FROM node:20-alpine
# Set the working directory inside the container
WORKDIR /app
# Copy dependencies list to container
COPY package.json ./
COPY pnpm-lock.yaml ./
# Install the dependencies
RUN npm install -g pnpm
RUN pnpm install

# Copy the entire application code
COPY . .

# Set environment variables for runtime
ENV NODE_ENV=production

# Note: The dist/ directory should be pre-built locally with 'pnpm build'
# and will be copied by COPY . . above

# Declare that port 4321 is needed (for Astro production server)
ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321

# Command to execute at container start
# Starts the Astro production server
CMD ["node", "dist/server/entry.mjs"]