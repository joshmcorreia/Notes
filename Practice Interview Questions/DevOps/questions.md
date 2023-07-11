# Practice DevOps Interview Questions

What is a monolith?
- A monolith is a large piece of software that continues to grow in size and operates on a single system. Updates to this system usually involve recompiling the entire application and do not scale well in the cloud.

What are some of the advantages of microservices when compared to monolithic applications?
- Microservices allow for fewer resources to be used and help lower resource expenses. They are also easier to scale than monolithic applications and offer greater flexibility when it comes to reducing downtime. Their modularity allows individual parts to be deployed rather than having to redeploy the entire application.

What are containers?
- Containers are portable and isolated virtual environments for applications. Isolation allows these applications to run without you having to worry about other interference from other applications. Containers are great for setting up microservices and are very lightweight for efficiency.

What is a container image?
- A container image is a read-only template containing instructions on how to create a container. The image should bundle the runtime, libraries, and dependencies so that the container can run on its own. Containers can be deployed from a single image across multiple different platforms such as workstations or Virtual Machines.

What is container orchestration?
- Container orchestration automates the deployment, management, scaling, and networking of containers. [Source](https://www.redhat.com/en/topics/containers/what-is-container-orchestration)
- Container orchestration makes it easier to have fault tolerance, on-demand scalability, optimal resource usage, auto-discovery to automatically communicate between containers, accessibility from the outside world, and seamless updates/rollbacks without any downtime. [Source](https://learning.edx.org/course/course-v1:LinuxFoundationX+LFS158x+1T2022/home)

What are some examples of container orchestrators?
- Amazon Elastic Container Service (ECS), Azure Container Instances (ACI), Kubernetes, and Docker Swarm.

Why use container orchestrators instead of manually managing containers?
- Container orchestrators make it much easier for users to manage hundreds or thousands of containers at once, and are specifically designed for this task. Manually managing hundreds of containers would be a nightmare and is very prone to mistakes. Container orchestration allows the user to automatically provision, deploy, scale, and manage containerized applications without worrying about the underlying infrastructure. [Source](https://cloud.google.com/discover/what-is-container-orchestration)
