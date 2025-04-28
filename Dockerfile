# Use official Nginx image
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

# Instead of ./build/, copy everything
COPY . .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
