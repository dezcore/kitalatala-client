FROM node:lts-alpine as base
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install

FROM base as dev
EXPOSE 3000
CMD ["npm", "run", "dev"]

FROM base as prod
RUN npm run build

#production stage
FROM nginx:stable-alpine as prod-stage
COPY --from=prod /app/out /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]