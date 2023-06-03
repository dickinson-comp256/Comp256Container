# The following variables provide configuration information to the
# build.bash script that creates and pushes the Docker images.

# The username that will be used to push the image to dockerhub.
# This user must be logged into dockehub in the terminal.
DOCKER_HUB_USER="braughtg"

# The name of the image to build and push.  
# This is appeneded to the DOCKER_HUB_USER value to produce the name
# of the dockerhub repository where the image will be pushed.
IMAGE="comp256-container"

# The tag for the image to build and push.
# This is appended to the repository name.
TAG="1.1.0"

# The list of platforms for which to build images.
PLATFORMS=linux/amd64,linux/arm64