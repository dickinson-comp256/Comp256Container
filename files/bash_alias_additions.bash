
machine ()
{
  java -jar -Dsun.java2d.xrender=false /home/student/bin/AsmMachine/Machine/bin/Machine.jar $@
}

assembler ()
{
  java -jar -Dsun.java2d.xrender=false /home/student/bin/AsmMachine/Assembler/bin/Assembler.jar $@
}
