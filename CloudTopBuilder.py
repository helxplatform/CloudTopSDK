#!/usr/bin/env python3

import sys
import yaml
import datetime
import os

# A section of global variables tat define essentialy string templates for generated files
# This is a template for an XFCE desktop shortcut
DESKTOP_FILE = """[Desktop Entry]
Version=1.0
Name=NAME
StartupNotify=true
Exec=EXEC
Icon=ICON
Terminal=false
Type=Application
"""   

# What is going on here you may ask: We need to remember that the user is not created in the
# container until the container starts.  This allows us to define the user name when we start the
# container.  But the .desktop files that we need to define the application icons have to be in the
# users Desktop directory.  We create an s6 system init file that moves the files into the correct place
# There are 2 parts to this: a header for the init file and a stanza for each desktop file
DESKTOP_INIT_FILE_HEADER = """#!/usr/bin/with-contenv sh
USER_HOME=/home/$USER_NAME
# This file automaticalliy generated by GENERATOR on TIME   

"""

DESKTOP_INIT_FILE_STANZA = """if [ ! -f $USER_HOME/Desktop/DESKTOP_FILE ] ; then
  if [ ! -d $USER_HOME/Desktop ] ; then
      mkdir $USER_HOME/Desktop
   fi
   cp /headless/Desktop/DESKTOP_FILE $USER_HOME/Desktop/DESKTOP_FILE
   chown -R $USER_NAME:$USER_NAME $USER_HOME/Desktop
fi
"""

# The file name for the init file.  S6 works just like good old init: the init files are executed
# in order of number.  50 is "late enough"
DESKTOP_INIT_FILE_NAME = "50-desktop-init.sh"

# First line of the generated docker file.  It is the from line for CloudTop
CLOUDTOP_HEADER_LINE = """
# Build file automaticalliy generated by GENERATOR on TIME   
# This docker build file creates a single docker image that contains CloudTop virtual Desktop
# and whatever content is added by the yaml formatted input file.
FROM heliumdatastage/cloudtop:latest
"""

# Last line of the generated docker file.  It tells docker to run the S6 init program
CLOUDTOP_ENTRYPOINT_LINE = """
# The required CloudTop entrypoint.  init starts the S6 system which reads the run direcories and
# starts the monitored services
ENTRYPOINT [ "/init" ]'
"""

def main():

   global DESKTOP_FILE, DESKTOP_INIT_FILE_HEADER, DESKTOP_INIT_FILE_STANZA, CLOUDTOP_HEADER_LINE, CLOUDTOP_ENTRYPOINT_LINE
   if len(sys.argv) < 3:
      print ("usage: dockerBuilder.py yamlFile outputDirectory")
      return

   thisExecutable = sys.argv[0]
   yamlFile = sys.argv[1]
   outputDir = sys.argv[2]

   now = datetime.datetime.now().ctime()

   # Open the input
   inFile = open(yamlFile)

   # Read the yaml file and grab the scripts and shortcuts
   parsedYaml = yaml.load(inFile, Loader=yaml.FullLoader)
   print ("parsedYaml: " , parsedYaml)

   outputs = parsedYaml["output"]
   print ("outputs: " , outputs)
   outputFileName = outputs["dockerFile"]

   outFile = open(outputDir + "/" + outputFileName, "w")
   run = parsedYaml["run"]
   print ("run: " , run)
   commands = run["commands"]
   print ("commands: " , commands)
   scripts = run["scripts"]
   print ("scripts: " , scripts)
   shortcuts = parsedYaml["shortcuts"]
   print ("shortcuts: " , shortcuts)

   # Insert the correct GENERATOR name and TIME and Add the header line
   CLOUDTOP_HEADER_LINE = CLOUDTOP_HEADER_LINE.replace("GENERATOR", thisExecutable).replace("TIME", now)
   outFile.write(CLOUDTOP_HEADER_LINE)
   outFile.write("\n")

   # loop through the commands.For each one prepend the RUN command and output to the file
   # execute it,
   for i in range(len(commands)):
      thisCommand = commands[i]
      outFile.write("RUN " + thisCommand)      
      outFile.write("\n")

   # loop through the scripts.For each one COPY it into the docker image, chmod +x and
   # execute it,
   for i in range(len(scripts)):
      thisScript = scripts[i]
      print ("found script", thisScript)
      outFile.write("COPY " + thisScript + " /")      
      outFile.write("\n")
      outFile.write("RUN chmod +x /" + thisScript + " && " + "/" + thisScript)      
      outFile.write("\n")
      outFile.write("\n")

   # loop through the shortcuts.  For each one we replace the name, exec and icon to create a
   # a desktop file that will eventually end up in the users Desktop directory.  If they
   # don't specify a name, we just use the exec.  If they don't specify an icon we use
   # applications-other, which is a fairly generic icon found in the XFCE distribution we are using

   # set the default icon: it's invariant
   defaultIcon = "applications-other"
   print ("type of shortcuts: " , type(shortcuts))

   # As noted above, we also need to create an init file but only if there is at least 1 shortcut 
   if len(shortcuts) > 0:
      # create the init file
      initFile= open(DESKTOP_INIT_FILE_NAME, "w")
      
      # add the required header
      initFile.write(DESKTOP_INIT_FILE_HEADER.replace("GENERATOR", thisExecutable).replace("TIME", now))
      
   for i in range(len(shortcuts)):
      thisShortcut = shortcuts[i]
      print("thisShortcut: " , thisShortcut)
      print("type of thisShortcut: " , type(thisShortcut))
      for key in thisShortcut:
         print("key is: ", key)
         attrs = thisShortcut[key]
         print("attrs : ", attrs)
         # get the required exec key
         exec = attrs["exec"]

         # BY default the name is the same as the exec
         name = exec

         if 'icon' in attrs:
            icon = attrs["icon"]
         else:
            icon = defaultIcon

         if 'name' in attrs:
            name = attrs["name"]
         
         # Create the desktopfile name
         desktopFileName = key + ".desktop"   
            
         # opem the desktopfile    
         desktopFile= open(desktopFileName, "w")

         # If the desktop file isn't executable, the launcher gives a warning.  No one wants that :)
         os.chmod(desktopFileName, 0o775)
         desktopFile.write(DESKTOP_FILE.replace("EXEC", exec).replace("NAME", name).replace("ICON", icon))

         # now added the needed stanza to the init file
         initFile.write(DESKTOP_INIT_FILE_STANZA.replace("DESKTOP_FILE", desktopFileName))
         initFile.write("\n")

      
   initFile.close()

   # Now we need to copy the desktop files and the container init files to the proper location
   outFile.write("COPY *.desktop /headless/Desktop/")
   outFile.write("\n")
   outFile.write("COPY " + DESKTOP_INIT_FILE_NAME + " /etc/cont-init.d/" + DESKTOP_INIT_FILE_NAME)
   outFile.write(CLOUDTOP_ENTRYPOINT_LINE)
#  print ("CLOUDTOP_HEADER_LINE: " , CLOUDTOP_HEADER_LINE)
#  print ("CLOUDTOP_ENTRYPOINT_LINE: " , CLOUDTOP_ENTRYPOINT_LINE)
#  print ("parsedYaml: " , parsedYaml)
#  print ("scripts: " , scripts)

   outFile.close()
if __name__ == "__main__":
   main()
