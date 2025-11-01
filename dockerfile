# Use official Nginx image to serve static files
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your website files (HTML, CSS, JS) into Nginx folder
COPY public/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Nginx runs automatically with its default command
