# CourseContainerTemplate

This Template Repository provides tools for quickly creating Debian based course/application specific Docker containers that can be used as a virtual machine.  

Images such as these are ideal for providing fully configured development or course environments.  For example:
* An environment for teaching the linux/Unix command line.
* Providing a fully configured web server, database and API framework for a full stack web development course.
* Providing particular compilers, assemblers, etc... for a course that requires specialized tools.
* Etc.

The Docker container created by this Template runs Debian Linux with an XFCE4 desktop environment and appears as shown here when in use.

![Debian XFCE4 desktop running in a VNC client](desktop.jpg)

## Requirements

The requirements for creating, testing, and using the image produced by this Template are:
* [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)
  * Or [Docker Engine on Linux](https://docs.docker.com/engine/install/)
* A VNC client (recommended)
  * E.g. [Tiger VNC](https://sourceforge.net/projects/tigervnc/files/stable/)
  * Note: The noVNC server allows the container to be accessed via a web browser.  However, the user experience is much better when using a full VNC client.
* A [Dockerhub Account](https://hub.docker.com/)
  * A dockerhub account is necessary for sharing the image. Users/students will not need a dockerhub account.

## Quick start

The following instructions will pull and create the container, start it, and connect to it:

1. To pull the image and create a new container, open a Terminal (WSL in Windows) and use the command:
   ```
   docker create --name Comp256 --publish 5901:5901 --publish 6901:6901 braughtg/comp256-container:1.1.0
   ```
   Note: This should only be done once.
2. Start the container using Docker Desktop or using the following command in a Terminal (WSL in Windows):
   ```
   docker start Comp256
   ```
3. Connect to the container:
   * Using a VNC Client (recommended):
  
     Start your VNC Client and connect to:
     ```
     localhost:5901
     ```

     The XFCE4 desktop should appear in the VNC Client window.

   * Using a browser (quick):

     Open the browser and connect to the URL: 
     ```
     https://localhost:6901
     ```

     The XFCE4 desktop should appear in the browser window.  
 
     Some tips for using the container via noVNC:
     * The noVNC menu (the little tab on the left side of the desktop) provides some helpful functionality.
     * To copy/paste between the host machine and the container you must use the clipboard accessed via the noVNC menu. This is a little inconvenient, but it is functional.
     * To enable the XFCE4 desktop to scale with the browser window, use the settings (the the gear) on the noVNC menu to set the “Scaling Mode” to “Remote Resizing.”
4. To stop the container use Docker Desktop or the following command in a Terminal (WSL in Windows):
   ```
   docker stop Comp256
   ```

## Container credentials

When connecting to the container the default user is automatically logged in.  No credentials will need to be provided to connect to the client. However, the default account does have `sudo` privileges within the container and the password will be required to run commands with `sudo`.

The default user has the following credentials:
* Username: `student`
* Password: `student`

## A note on persistence of container data

The container created by the `create` command above works well for most basic use cases. It persists changes to the container (e.g. user installed software, changes within the `student` home directory) in the writeable layer of the container.  Thus, all changes are preserved across container stops and starts, so long as the container is not deleted.  If the container is deleted all changes will be lost. 

If greater persistence is desired it is possible to preserve the changes within the `student` home directory across container deletions using either a Docker volume or on the file system of the host machine.  

To preserve the `student` home directory in a Docker Volume adapt the following `mount` flag and add it to the `docker create` command used to create the container:

```
--mount type=volume,source=<volume name>,target=/home/student
```

To preserve the `student` home directory on the host machine file system adapt the following `mount` flag and add it to the `docker create` command used to create the container:

```
--mount type=bind,source=<host directory path>,target=/home/student
```

## More details

For all of the details about what is behind this Template Repository see the [CourseContainerTemplate](https://github.com/braughtg/CourseContainerTemplate) and the [VncNoVNCContainerBase](https://github.com/braughtg/VncNoVncContainerBase) repos.
