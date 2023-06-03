# This script is run by the Dockerfile as root during the build process.
# It should be used to do configuration of the image as the student user.
# Very typically this includes per user configuratoin and cloning git 
# repositories that are needed.

# E.g.
# git clone https://github.com/someRepo.git

# Make a bin directory where we can put any applications.
mkdir bin
cd bin

# Get the Machine simulator and Assembler and setup some bash
# aliases to make them easy to use.
git clone https://github.com/dickinson-comp256/AsmMachine.git

cd ~
cat << EOF >> .bash_aliases

machine ()
{
  java -jar -Dsun.java2d.xrender=false /home/student/bin/AsmMachine/Machine/bin/Machine.jar $@
}

assembler ()
{
  java -jar -Dsun.java2d.xrender=false /home/student/bin/AsmMachine/Assembler/bin/Assembler.jar $@
}
EOF


