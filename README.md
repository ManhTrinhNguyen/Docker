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
  - Choose a Alphine Image base Distribute System

  - Use smaller Image for Less Storage, Transfer faster


  ----Issue with full-blown Images----

  - Security Issue . Easier to attack Bcs contain of 100 
```

















