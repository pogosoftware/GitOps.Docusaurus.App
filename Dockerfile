FROM node:22-alpine as builder
WORKDIR /app

RUN corepack enable && corepack prepare pnpm@latest --activate
COPY package.json pnpm-lock.yaml* ./
RUN pnpm install

COPY . .
RUN pnpm build

FROM nginx:1.28-alpine
WORKDIR /app
COPY --from=builder /app/build /usr/share/nginx/html
