# ---- Base Node ----
FROM node:19-alpine AS base
WORKDIR /app
COPY package*.json ./

# ---- Dependencies ----
FROM base AS dependencies
RUN npm ci

# ---- Build ----
FROM dependencies AS build
RUN npm run build

# ---- Production ----
FROM node:19-alpine AS production
WORKDIR /app
COPY --from=dependencies /node_modules ./node_modules
COPY --from=build /.next ./.next
COPY --from=build /public ./public
COPY --from=build /package*.json ./

# Expose the port the app will run on
EXPOSE 9002

# Start the application
CMD ["npm", "start"]
