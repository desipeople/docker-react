# Use existing docker image as a base
# hub.docker.com where you look for node
FROM node:alpine as builder

WORKDIR '/app'

# Download and install dependency
# copy files from current dir to container
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

