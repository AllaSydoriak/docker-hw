FROM node as build

WORKDIR /app

COPY package.json /app
RUN npm install

COPY . /app

RUN npm run build


FROM nginx

COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE $PORT

CMD ["nginx", "-g", "daemon off;"]
