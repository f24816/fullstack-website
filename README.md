## Setup

   Add the *to be created* admin database credetials in a `.env` file at the root of your project:

   ```env
   POCKETBASE_ADMIN_EMAIL=<email>
   POCKETBASE_ADMIN_PASSWORD=<password>
   ```

   Ensure you have [Docker](https://www.docker.com/get-started/) and [pnpm](https://pnpm.io/installation) installed on your machine.

   ```bash
   pnpm install
   pnpm build
   docker compose up --build -d
   ```

## Setup Database

   After starting the Docker containers, you need to set up the PocketBase database. Open your browser and navigate to `http://localhost:8090`. Log in using the admin credentials you specified in the `.env` file.

   Once logged in, create a new collection `items` with text filed `type` and enable API rules for list and view. Add some sample data to the collection.

## Updating Application

   The docker container is linked to the `dist` folder. To update the application, simply rebuild the project and restart the container:

   ```bash
   pnpm build && docker container restart astro
   ```