# ============================
# 1. Build Stage
# ============================
FROM node:20-alpine AS build

WORKDIR /app

# Copy only package files first (better caching)
COPY package*.json ./
RUN npm ci --silent

# Copy source code
COPY . .

# Force Vite to output to /app/dist (even if config is wrong)
ENV VITE_OUT_DIR=dist
RUN npm run build -- --outDir dist
# Alternative (cleaner): just RUN npm run build if you're 100% sure vite.config has no outDir override

# ============================
# 2. Production Stage
# ============================
FROM nginx:alpine AS production

# Copy custom nginx config (optional but recommended)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the built app from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]