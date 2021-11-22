FROM node:14-alpine as build

WORKDIR /app

COPY package.json /app
RUN npm install

COPY . /app

RUN npm run build


FROM nginx

COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8003

CMD sed -i -e 's/8003/'"8003"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'