- [Container](#Container)

- [Container vs Image](#Container-vs-Image)

- [Docker vs Virtual Machine](#Docker-vs-Virtual-Machine)

- [Docker Architecture and its components](#Docker-Architecture-and-its-components)

- [Docker Project](#Docker-Project)
 
  - [Docker in Software Development](#Docker-in-Software-Development)
 
  - [Docker Network](#Docker-Network)

## Container 

#### What is container ? 

- Container is a way to package application with all the necessary dependencies and configuration

- And that Package is protable . Easy to share and move around the team

- And that portable of containers plus everything package in one isolated environment that make development and deployment process more efficent

#### Where container live ? 

- Container live in container Repository . This is a special type of Repo to store Container

#### How container improve development process ? 

- Before the container : Usally I have a team of developers working on some application I would have to install most of the services on my OS directly . For example I develop Javascript Apps and I need PostgreQL and I need Redis for messaging and every developer in the team go and install the binaries of those services configure them and run them on their local development evironment . Depend on the OS they are using the installation will look different . Also I have multiple step where something could go wrong . This approach can be pretty tedious depending on how complex my application is .

- Before the container Process : Development team will produce the artifacts together with a set of instruction of how to install and configure those artifact on the server . In addition I would have some kind of DB . So the Dev team will give the Artifacts over to the Operations Team and the Operations Team will handle setting up the enviornment to deploy Application  

- After container : With Container I don't have to intall any of the Services directly on my OS . Bcs the Container is it own isolated environment layer with Linux based image, I have everything packaged in one isolated environment . And the download step is just 1 docker command , which fetches the container and start at the same time. Regraless any OS that I use the docker command will be the same

- Also I can have differnet versions of the same application running on my local environment without having any conflict .

- After container Process:
  
    - Developer and Operations work together to package the application in a container .
 
    - No Environemnt configuration needed on Server - Except Docker Runtime
---

## Container vs Image 

- Container is made up of Images . We have layers of stacked Images on top of each other and the base of most of the contaier I would have Linux based Image

- Advantage of splitting those applications in layers is that . For example that Image change or I have to download a newer version of Postgres . What happens is that the layers that are the same between those 2 application , 2 version of Postgres will not be downloaded again but only those the Layers different

- To run a Images : `docker run ...`

#### 2 Technical term of Image and Container 

- Images is the actual application package together with the configuration and the dependencies . This is actually the artifact movable around

- Container is when I pull the Image to my local machine and I actually start it, so the application inside acutally starts that create the container Evironment . It's not running is a Image, If I start it and run it on my machine it is a Container 

---

## Docker vs Virtual Machine 

#### How is OS made up ? 

- OS have 2 layers : OS Kernal and OS Applications Layer

  - OS Kernal is at the core of every OS . Is a part that communication with hardware components like CPU and Memory ...
 
  - OS Application run on the Kernal Layer so they based on the Kernal layer . For example  Linux OS and there is a lots of distribution of Linux out there , Ubuntu and Debian and there is Linuxmint etc.. GUI look different, the file system is maybe different, so a lot of application that I use are different . Bcs even though they use the same Linux Kernal they use different Application on top of Kernal
 
- Docker and Virtual machine they're both virtualization tools . Question is What parts of the OS they virtualize .

  <img width="568" alt="Screenshot 2025-04-01 at 22 08 31" src="https://github.com/user-attachments/assets/6e2ecea1-3bfa-4c9b-b3bf-9b2ee12e186d" />

  - Docker virtualize the OS Application Layer .
 
    - When I download the Docker Image, it actually contains the application layer of the OS and some other Applications installed on top of it and it uses the kernel of the host bsc it doesn't have it's own kernal
   
  - The Virtual Machine has the Application layers and its own Kernel so it virtualizes the complete operating system, which mean that when I download the virtual machine image on my host it doesn't use my host Kernal it boost up its own
 
  <img width="240" alt="Screenshot 2025-04-01 at 22 09 04" src="https://github.com/user-attachments/assets/63563197-30e1-4a5c-994c-f6d2a760e523" />

#### What affects has this difference ? 

- Size :The size of Docker Images much smaller, bcs they just have to implement one layer. So Docker Images are usally a coupel of megabytes.  Virtual Machine can be couple of Gigabyets

- Speed : I can start and run Docker container much faster than VM bcs everytime I start them I have to boost the OS Kernel

- Compatibility : I can run Virtual Machine image of any OS on any other OS host . but I can't do that with Docker

  - What is a problem ? Let say I have Window OS with Window Kernel and its application layers and I want to run a Linux base Docker Image directly on the Window host . The problem here is Linux based Docker Images can not use Window Kernel It would need a Linux Kernel to run .
 
  - However when I am developing on Windows or MacOS . I want to run various services, bcs most container for the Popular services are Linux based . Also Docker originally written and built for Linux OS but later Docker made an update call Docker Desktop for Window and Mac which made it possible to run Linux based .
 
  - So the way it work is Docker Desktop uses hypervisor layer with lightweight Linux distribution on top of to provide the needed Linux Kernel and this way make running Linux-based container possible on Window and Mac  OS . 
---

## Docker Architecture and its components 

<img width="600" alt="Screenshot 2025-04-01 at 22 29 04" src="https://github.com/user-attachments/assets/8a48a299-36fd-467a-b6cd-8501d3529713" />

- When I install Docker I acutally install the Docker Engine which comes with 3 parts .

  - Docker Server : Responsible for pulling Images, Storing the, starting containers, stopping containers and so on
 
  - Docker API : API for interacting with Docker Server
 
  - CLI : which is a very powerful client to execute docker command aginst the server . To tell docker server to pull image, run and stop containers
 
#### Docker Server 

<img width="600" alt="Screenshot 2025-04-01 at 22 31 23" src="https://github.com/user-attachments/assets/038a4a6e-6294-43ef-8d4d-aa46abef9aca" />

- Container runtime : Reposible for pulling images , start container stop container

- Volumes : Reposible for persisting data and container

- Nerwork : Configuring network for container communication

- Build Images : Build own Docker Images  


## Docker Project 

<img width="600" alt="Screenshot 2025-06-06 at 12 37 25" src="https://github.com/user-attachments/assets/50d39c6a-3ee5-4582-9940-69d015b582b2" />

#### Project Overview 

Use Docker for local development

Technologies used:

- Docker, Node.js, MongoDB, MongoExpress

Project Description:

- Create Dockerfile for Nodejs application and build Docker image

- Run Nodejs application in Docker container and connect to
  
- MongoDB database container locally. Also run MongoExpress container as a UI of the MongoDB
database.

#### Docker in Software Development 

First will be a simple UI backend application using Javascript, HTML structure and Nodejs in the backend 

In order to intergrate into the DB, we will use a Docker container MongoDB . Also to make working with MongoDB much easier so we will deploy a Docker container MongoExpress which is a MongoDB UI where we can see the database structure 

#### MongoDB Image and Mongo Express Images 

Go to DockerHub and get the MongoDB Image  (https://hub.docker.com/_/mongo)

Mongo Express Image (https://hub.docker.com/_/mongo-express)

To pull MongDB : `docker pull mongo` -> This will pull a latest version

To pull MongExpress: `docker pull mongo-express`  -> This will pull a latest version

#### Docker Network 

In order to run both MongoDB and Mongo express containers and available for my Nodejs application and also connect them together we need `Docker Network`

Docker create the isolated Docker network where containers are running in. 

- When I deploy 2 containers in the same Docker Network, they can talk to each other using just `container name` with `localhost:port` .

- And Application that run outside of Docker Network which is Nodejs will connect to them from outside or from the host using `localhost:port`

- Later when package our application into its own Docker Image . We will have Docker Network with MongoDB container, MongExpress container and Nodejs Application 

To see Docker network : `docker network ls`

To create my own network : `docker network mongo-network`

To make the docker containers run inside the network we have to make `-n` options 

#### Run MongDB 

To run MongDB : 

```
docker run -d \
-p 27017:27017 \
--name mongodb \
--net mongo-network \
-e MONGO_INITDB_ROOT_USERNAME=admin
-e MONGO_INITDB_ROOT_PASSWORD=password
mongo
```

`-e MONGO_INITDB_ROOT_USERNAME=admin` and `-e MONGO_INITDB_ROOT_PASSWORD=password` is a root mongodb username and password . We need that for Mongexpress to connect to Mongdb

`-name mongodb` This is a name of the container

`-n mongo-network` This is a network name that I created above 

`mongo` is a image name 

#### Run MongExpress 

To run MongoExpress :

```
docker run -d \
-p 8081:8081 \
--net mongo-network \
--name mongoexpress \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
-e ME_CONFIG_MONGODB_SERVER=mongodb \
-e ME_CONFIG_BASICAUTH_USERNAME=user \
-e ME_CONFIG_BASICAUTH_PASSWORD=pass \
-e ME_CONFIG_MONGODB_SERVER=mongodb \
-e ME_CONFIG_MONGODB_URL=mongodb://mongodb:27017 \
mongo-express
```

`--net mongo-network`: The same network where mongdb is running 

`--name mongexpress` : This is a name of the container

`-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin` and `-e ME_CONFIG_MONGODB_ADMINPASSWORD=password` . This is a MongDB username and password that I configured above 

`-e ME_CONFIG_MONGODB_SERVER=mongodb` : This is a container name the express will use to connect to the Docker, bcs they are running in the same network. Only bcs of that this configuration will work  

`-e ME_CONFIG_MONGODB_PORT=27017` : The Port by default is the correct one so i don't need to apply that 

`-e ME_CONFIG_BASICAUTH_USERNAME=user` and `-e ME_CONFIG_BASICAUTH_PASSWORD=pass` I can login using these credentials in mongoexpress 

`-e ME_CONFIG_MONGODB_SERVER=mongodb` I need to connect to mongdb server using MongoDB container name

`-e ME_CONFIG_MONGODB_URL=mongodb://mongodb:27017` : If I don't set this I can get error from Mongo Express logs Say server cannot located 

MongExpress Docs in Dockerhub not up to date . In order to see up to date docs I can go to (https://github.com/mongo-express/mongo-express)

#### Connect Node Server with MongoDB Container

Now we have MongDB and MongExpress container running . We will have to connect Nodejs with DB

To do that we have to give a protocol of the DB and the URI, and the URI for a MongoDB `localhost:27017`

We will use `MongoClient` which node module , and using that `MongoClient` to connect to the MongoDB 

This is a protocol `let mongoUrlLocal = "mongodb://admin:password@localhost:27017"` (Never put password and username in the code . This is just for reference)


## Project 5: Create Docker Repository on Nexus and Push to It

### Technologies Used
- **Docker**
- **Nexus**
- **DigitalOcean**
- **Linux**

### Project Description
- Created a Docker-hosted repository on **Nexus**.
- Configured **Nexus**, a DigitalOcean Droplet, and Docker to push images to the Nexus repository.
- Built and pushed a Docker image to the Docker repository hosted on Nexus.

---

## Project 6: Persist Data with Docker Volumes

### Technologies Used
- **Docker**
- **Node.js**
- **MongoDB**

### Project Description
- Configured a **Docker Volume** to persist data for a MongoDB container.
- Ensured data durability and availability across container restarts.

---

## Project 7: Deploy Nexus as Docker Container

### Technologies Used
- **Docker**
- **Nexus**
- **DigitalOcean**
- **Linux**

### Project Description
- Created and configured a Droplet on **DigitalOcean**.
- Set up and deployed **Nexus** as a Docker container for repository management.




## Docker Best Practice 

**Best Practice 1**

```
  - Use Official Base Image as Base Image 
```

**Best Practice 2**

```
  - User Specific Version 
```

**Best Practice 3**

```
  - Use smaller Image for Less Storage, Transfer faster

  - Choose Smaller Image with Leaner OS Distribution with only bundle nessesary utilities 

  ----Issue with full-blown Images----

  - Security Issue . Easier to attack

  - Larger size will transfer slower

  - So the Best practice choose a Image with specific Version based on a leaner OS Distribution like Alpine 
```

**Best Practice 4**

```
  - Optimizing Caching Image Layer when building a Images

  ----What are Images Layer? and Caching Image Layer mean?----

  - Docker Image built based on Dockerfile . In Dockefile each command or instruction create an Image Layer . So Every Docker Image is made up of Layer . This mean when I use a base Image like : Node:alpine, It already built base on a lot of Layers. This is how Image created using multiple Layer

  - Each Layer will get Cache by Docker . If I rebuild a Image and Dockerfile hasn't change so Docker use a Cached Layer to build Image . This make build a Image much faster . Even for pull and push Image .

  ----To Optimizing Caching Image Layer----

  !!! NOTE : When a Layer changed every Layer bellow (Downstream Layers) has to be re-created

  - In some case some Layers Bellow don't need to re-created . So I will re-structure the Dockerfile to Optimizing Caching Image Layer

  - The rules here is I should order my Dockerfile Command from the least to the most frequently change  

```

  - Example of re structure Nodejs Docker file : I Copy only Package.json file then Run npm install and only after that I run a Copy file command . 

  <img width="400" alt="Screenshot 2025-03-14 at 21 11 07" src="https://github.com/user-attachments/assets/73d457f7-5099-46e4-92d8-1e888ceff713" />

  <img width="400" alt="Screenshot 2025-03-14 at 21 12 29" src="https://github.com/user-attachments/assets/105b8c9a-6f5e-4651-9459-a144cba3a74a" />

**Best Practice 5**

  - When we build Image we don't need everything inside the Docker Image like : Readme file, Auto generate folder like build, libs ...

  - Use .dockerignore file to explicitly excludes files and folder that I don't need in the Image

**Best Practice 6**

  - Now there is some content or files that I need during build image process but I don't need them in the final Image itsefl to run Application

  - The way it work is while I am building a Image from Dockerfile many artifacts actually get created which are required only during the build time and this could be Dev Tools and Library needed for compiling Application or it could be dependencies need to run Unit test ... . If I keep those files in the final Image eventhough they are not nessesary to run a Application It will increase size of the Image and Increase Attack Surface

  - Example like Package.json or Pom.xml or any other dependencies files which specifi all the dependencies for the project and are needed to install those dependencies . However once the dependencies are installed We don't need this file in the Image itself to run the Application

  - Another example : When building Java Application I need JDK to compile Java source Code but JDK is not needed to run Application itself . In addition to that I may use tool like Gradle or Maven to build Application but are not needed to run the Application

  ----How do I separate Build Stage from Runtime Stage----

  - I use multi Stage build . The multile Stage build allow me to use multiple temporary Images during the build process but keep only the latest image as the final artifact  

<img width="600" alt="Screenshot 2025-03-14 at 21 49 21" src="https://github.com/user-attachments/assets/af13ff3c-c945-414a-8499-d1f93196c399" />

  - In the example above : I have a Build Stage above and the Run Stage bellow . The Build Stage use to build a Maven Package artifact . And the Run Stage Copy Maven Aftifact from the Build Stage and run it . So in the final Image the Build Stage will get removed . Now the Image layer only have 2 in the Run Stage .

**Best Practice 7**

  - Now when we create this Image and run it as a Container Which OS user will be use to start the Application inside ?
  
  - By default Dockerfile does not specify a user it uses a Root User . But in reality never should run Application as Root User

  - The Solution is to create dedicate User with a dedicated Group in Docker Image to run Application 

  <img width="600" alt="Screenshot 2025-03-14 at 21 58 48" src="https://github.com/user-attachments/assets/214d310a-eed4-4864-98b3-4b1d04b3f51d" />

  - To create user and group in Image : `RUN groupadd -r tom && useradd -g tom tom`.

  - Then I set ownership and permission to that user : `RUN chown -R tom:tom /app`

  - Then I switch to that User : `USER tom`

  - Then I run the App : `CMD node index.js`

**Best Practice 8**

  - How do I know that the Image has built has few or no security vulnerable ?

  - Using `docker scout cves myapp:1.0` command to scan my Image for Security vulverability

  !!! Note : I have to login to Docker Hub in able to scan Images

  - In the background Docker will scan against its own Database of known vulnerabilities to run vulnerabilities scan on the Image . The Database of known vulnerabilities gets constantly updated, so new one get discover and edit all the time for different Images 



