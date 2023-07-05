## **WordPress Site Management Script**

## **This script allows you to easily create, manage, and delete a WordPress site using Docker and Docker Compose.**
## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
  - [Create a WordPress site](#create-a-wordpress-site)
  - [Manage the site](#manage-the-site)
  - [Delete the site](#delete-the-site)
- [License](#license)
- [Contact](#contact)


## **Prerequisites**

**Before using this script, ensure that you have the following dependencies installed:**

- [Docker](https://docs.docker.com/get-docker/): Ensure Docker is installed on your system.
- [Docker Compose](https://docs.docker.com/compose/install/): Ensure Docker Compose is installed on your system.

## **Usage**

**To use this script, follow the instructions below:**

1. **Clone the repository to your local machine:**
   ```shell
   git clone https://github.com/ItsDev75/wordpress_management.git
   ```

2. **Navigate to the script directory:**
   ```shell
   cd repository-name
   ```

3. **Make the script executable:**
   ```shell
   chmod +x script.sh
   ```

4. **Run the script with the desired command:**

   - **Create a WordPress site:**
     ```shell
     ./script.sh create <site_name>
     ```
     Replace `<site_name>` with the desired name for your WordPress site. This command will check if Docker and Docker Compose are installed. If not, it will install them for you. Then, it will create a new directory for your WordPress files, generate a `docker-compose.yml` file with the necessary configurations, and start the Docker containers.

   - **Manage the site:**
     ```shell
     ./script.sh manage <start|stop>
     ```
     Use this command to start or stop the Docker containers for your WordPress site. Replace `<start|stop>` with either `start` or `stop` to control the containers accordingly.

   - **Delete the site:**
     ```shell
     ./script.sh delete
     ```
     This command will stop and remove the Docker containers, delete the WordPress files directory, and clean up the `/etc/hosts` file entry.

5. **Follow the instructions provided by the script.** For example, after creating a site, it will display the URL where you can access your WordPress site in a browser.

## **License**

[Specify the license under which the code in this repository is distributed. If you are using an open-source license, provide a brief summary of the license terms.]

## **Contact**

**If you have any questions or issues regarding this script, please contact [provide contact information or a link to the issue tracker].**
```

You can copy this Markdown code and paste it directly into your README.md file in your GitHub repository.
