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
