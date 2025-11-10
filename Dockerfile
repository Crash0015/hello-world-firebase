# Use a lightweight Nginx base image
FROM nginx:alpine

# Copy static files (HTML, CSS, JS)
# to the default Nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80, which is the one Nginx listens on
EXPOSE 80

# Command to start Nginx when the container boots
CMD ["nginx", "-g", "daemon off;"]