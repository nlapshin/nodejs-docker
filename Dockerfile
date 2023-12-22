# FROM - это специальная команда указывает на базе какого образа создавать наш образ.
# можно указать версию и размер образа(alpine-slim)
FROM node:alpine

# Просто сложит в корень, если не укажу WORKDIR
WORKDIR /usr/src/app

# Копируем внутрь образа package.json
COPY package*.json ./
# Внутри образа запускаем команду по установки
RUN npm ci

# Будем собирать наше ПО
COPY tsconfig.json ./
COPY src ./src
RUN npm run build

# Прописать команду, которая будет выполняться при старте нашего образа.
CMD [ "node", "./build/index.js" ]







# # сборка и назвал её build-state
# FROM node:alpine as build-stage

# WORKDIR /usr/src/app

# COPY package*.json ./
# RUN npm ci



# RUN npm run build

# # запуск и назвал её run-state
# FROM node:alpine as run-stage

# WORKDIR /usr/src/app

# RUN chown node:node ./
# COPY --chown=node:node --from=build-stage /usr/src/app .

# USER node

# CMD [ "node", "./build/index.js" ]
