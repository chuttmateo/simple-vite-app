FROM node:current-alpine3.18 AS build

WORKDIR /app
COPY . .
RUN npm i && npm run build

FROM httpd:alpine3.18
COPY --from=build /app/dist /usr/local/apache2/htdocs