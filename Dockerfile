FROM node:current-slim

# Set working directory
WORKDIR /app

COPY . .

RUN npm install
# RUN npm run build

ENV PORT=3000

EXPOSE 3000

CMD [ "npm", "start" ]


# To build:
# $ docker build -t <IMAGE_NAME> .

# To run:
# $ docker run -p 3000:3000 <IMAGE_NAME> 