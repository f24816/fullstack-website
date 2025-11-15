#!/bin/sh

# Download and setup PocketBase (only if not already present)
if [ ! -f ./pocketbase ]; then
  apk add --no-cache wget unzip
  wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.13/pocketbase_0.22.13_linux_amd64.zip -O pb.zip
  unzip pb.zip
  rm pb.zip
  chmod +x pocketbase
fi

# Start PocketBase in the background
./pocketbase serve --http=0.0.0.0:8090 &
PB_PID=$!

# Wait for PocketBase to be ready
sleep 5

# Create admin user if it doesn't exist
./pocketbase admin create "$POCKETBASE_ADMIN_EMAIL" "$POCKETBASE_ADMIN_PASSWORD" || true

# Keep PocketBase running
wait $PB_PID