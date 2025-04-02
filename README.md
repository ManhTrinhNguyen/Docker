# Demo Projects: Containers with Docker

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

## Project 2: Docker Compose - Run Multiple Docker Containers

### Technologies Used
- **Docker**
- **MongoDB**
- **MongoExpress**

### Project Description
- Wrote a **Docker Compose** file to manage and run multiple Docker containers for:
  - **MongoDB**: Database service.
  - **MongoExpress**: UI for MongoDB database management.

---

## Project 3: Deploy Docker Application on a Server with Docker Compose

### Technologies Used
- **Docker**
- **Amazon ECR**
- **Node.js**
- **MongoDB**
- **MongoExpress**

### Project Description
- Copied the **Docker Compose** file to a remote server.
- Logged in to a private Docker registry on the remote server to fetch the application image.
- Deployed and started the application container along with **MongoDB** and **MongoExpress** services using Docker Compose.

---

## Project 4: Dockerize Node.js Application and Push to Private Docker Registry

### Technologies Used
- **Docker**
- **Node.js**
- **Amazon ECR**

### Project Description
- Wrote a **Dockerfile** to build a Docker image for a Node.js application.
- Created a private Docker registry on **AWS (Amazon ECR)**.
- Pushed the Docker image to this private repository for secure storage and deployment.

---

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



