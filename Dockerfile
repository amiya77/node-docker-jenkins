FROM node:latest
WORKDIR /apps
COPY . .
RUN npm install
CMD ["node", "index.js"]
