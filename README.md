# DockerAngularApp

This project was generated using [Angular CLI](https://github.com/angular/angular-cli) version 20.1.4.

## Development server

To start a local development server, run:

```bash
ng serve
```

Once the server is running, open your browser and navigate to `http://localhost:4200/`. The application will automatically reload whenever you modify any of the source files.

## Code scaffolding

Angular CLI includes powerful code scaffolding tools. To generate a new component, run:

```bash
ng generate component component-name
```

For a complete list of available schematics (such as `components`, `directives`, or `pipes`), run:

```bash
ng generate --help
```

## Building

To build the project run:

```bash
ng build
```

This will compile your project and store the build artifacts in the `dist/` directory. By default, the production build optimizes your application for performance and speed.

## Running unit tests

To execute unit tests with the [Karma](https://karma-runner.github.io) test runner, use the following command:

```bash
ng test
```

## Running end-to-end tests

For end-to-end (e2e) testing, run:

```bash
ng e2e
```

Angular CLI does not come with an end-to-end testing framework by default. You can choose one that suits your needs.

## Additional Resources

For more information on using the Angular CLI, including detailed command references, visit the [Angular CLI Overview and Command Reference](https://angular.dev/tools/cli) page.

## Docker Desktop

Download from: https://www.docker.com/products/docker-desktop/

Once installed, run:

docker --version

## Dockerize the Angular App

Angular must be built, then served using Nginx in Docker.

Create a Dockerfile in the project root:

Create:

Dockerfile
----------

# Step 1: Build Angular App
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Step 2: Run web server (Nginx)
FROM nginx:alpine
COPY --from=build /app/dist/hello-world-app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

## Build the Docker Image

docker build -t angular-hello-world .

This creates an image named angular-hello-world.

## Docker images list

docker images

## Run the Docker Container

docker run -p 8080:80 angular-hello-world

Now open your browser:

👉 http://localhost:8080

You will see:

💥 Hello World from Angular! 💥

🎉 DONE!

You have:

✔ Created Angular project
✔ Printed Hello World
✔ Built using Docker
✔ Served via Nginx
✔ Viewed in browser using container