# This script is run by the Dockerfile as root during the build process.
# It should be used to do configuration of the image as the student user.
# Very typically this includes per user configuratoin and cloning git 
# repositories that are needed.

# E.g.
# git clone https://github.com/someRepo.git
