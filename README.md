# Demo Projects: Containers with Docker

## Project 1: Use Docker for Local Development

### Technologies Used
- **Docker**
- **Node.js**
- **MongoDB**
- **MongoExpress**

### Project Description
- Created a **Dockerfile** for a Node.js application and built a Docker image.
- Ran the Node.js application in a Docker container and connected it to a MongoDB database container locally.
- Deployed **MongoExpress** as a container to serve as the UI for the MongoDB database.

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

<img width="600" alt="Screenshot 2025-03-14 at 21 11 07" src="https://github.com/user-attachments/assets/cfed3aa4-dd09-44c9-9bfb-e6c18599b59a" />

  - In the example above : I have a Build Stage above and the Run Stage bellow . The Build Stage use to build a Maven Package artifact . And the Run Stage Copy Maven Aftifact from the Build Stage and run it . So in the final Image the Build Stage will get removed . Now the Image layer only have 2 in the Run Stage .








