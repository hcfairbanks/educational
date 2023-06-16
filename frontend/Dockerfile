# # build step
# FROM node:18.16-alpine as build
# # WORKDIR /app
# COPY package.json ./
# RUN npm install
# COPY . ./
# RUN npm run dev
# CMD ["npm", "run", "dev"]
# # release step
# FROM nginx:1.21.5-alpine as release
# COPY --from=build /app/build /usr/share/nginx/html/
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]


# This worked
# FROM node:18.16-alpine
# WORKDIR /frontend
# COPY package.json ./
# RUN npm install --silent
# COPY . ./
# CMD ["npm", "run", "dev"]



FROM node:18.16-alpine

WORKDIR /frontend

COPY package.json ./

RUN npm install -g npm@9.7.1

RUN npm install -g pnpm

RUN pnpm install

COPY . ./

CMD ["pnpm", "dev"]
#CMD ["node", "dist/main.js"]