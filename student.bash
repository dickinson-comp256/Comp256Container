# This script is run by the Dockerfile as root during the build process.
# It should be used to do configuration of the image as the student user.
# Very typically this includes per user configuratoin and cloning git 
# repositories that are needed.

# E.g.
# git clone https://github.com/someRepo.git

# Make a bin directory where we can put any applications.
mkdir bin
cd bin

# Get the Machine simulator and Assembler
git clone https://github.com/dickinson-comp256/AsmMachine.git

# Setup some bash aliases to make the simulator and assembler eaiser to use.
cd ~
cat /files/bash_alias_additions.bash >> .bash_aliases

