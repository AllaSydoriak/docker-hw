FROM node as build

WORKDIR /app

COPY package.json /app
RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx.conf /usr/local/etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
