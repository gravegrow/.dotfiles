import maya.cmds as cmds

cmds.commandPort(name=":8722", sourceType="mel", noreturn=False, echoOutput=False, bufferSize=4096)
