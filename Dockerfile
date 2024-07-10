FROM nginx:mainline-alpine as server-base
FROM node:22-alpine as build-base

ARG GIT_REPO="pdomdev/pdom"

FROM build-base as cloner
WORKDIR /app
RUN apk add --no-cache git
RUN git clone https://github.com/${GIT_REPO}.git pdom
WORKDIR /app/pdom
RUN git checkout main
RUN git pull

FROM build-base as builder
RUN mkdir -p /app
COPY --from=cloner /app/pdom /app/pdom
WORKDIR /app/pdom
RUN npm ci
RUN npm run build

ARG PORT=80

FROM server-base as server
COPY --from=builder /app/pdom/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE ${PORT}
CMD ["nginx", "-g", "daemon off;"]