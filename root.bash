# This script is run by the Dockerfile as root during the build process.
# It should be used to do system wide configuration of the image.
# Very typically this includes installing and configuring software 
# using apt install.

# E.g.
# apt update
# apt install --no-install-recommends -y aPackage
