#IST SUB-SECTION NAMED AS BUILDER
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#AT PRODUCTION ONLY CARE ABOUT /app/build


#second phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html