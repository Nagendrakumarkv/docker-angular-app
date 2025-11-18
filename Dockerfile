# Step 1: Build Angular App
FROM node:22 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Step 2: Run web server (Nginx)
FROM nginx:alpine
COPY --from=build /app/dist/docker-angular-app/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
