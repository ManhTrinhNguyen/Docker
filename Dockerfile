FROM node:24-alpine


ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

COPY ./app /home/app


# Install shadow package to get groupadd and useradd
RUN apk add --no-cache shadow

# Create group and user 
# This command will create a system group tim and create new user tim and add tim to a tim groups
RUN groupadd -r tim && useradd -g tim tim 

# Set ownership and permission for tim 
RUN chown -R tim:tim /home/app 

# Switch to tim user 
USER tim 

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]


