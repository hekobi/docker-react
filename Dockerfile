FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#test1 move to git
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html