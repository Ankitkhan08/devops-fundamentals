# Stage 1: The "Builder" stage (Our Big, Messy Kitchen)
# We use the full node:18 image because it has all the tools to build our app
FROM node:18 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json first to leverage Docker's build cache
COPY package.json .

# Run npm install to download dependencies and create the node_modules folder
# This is us "making the pizza"
RUN npm install

# Copy the rest of our application source code
COPY . .

# --- This is the dividing line. The kitchen's job is done. ---

# Stage 2: The "Final" stage (Our Small, Clean Plate)
# We start fresh from a very small and secure base image
FROM node:18-alpine

# Set the working directory again for this new stage
WORKDIR /app

# This is the magic step: We reach back into the "builder" stage (the kitchen)
# and copy ONLY the things we need.
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/server.js ./server.js

# Expose the port the app will run on
EXPOSE 3000

# The command to start our app
CMD ["node", "server.js"]
