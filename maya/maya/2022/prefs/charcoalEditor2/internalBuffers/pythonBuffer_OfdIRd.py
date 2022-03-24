from maya.api import OpenMaya as om


sel = cmds.ls(sl=True)[0]
sel_vtx = cmds.ls('{}.vtx[:]'.format(sel), fl=True)

for num, item in enumerate(sel_vtx):
    print(str(num) + " : " + item)


execfile

import maya.cmds as cmds

cmds.commandPort(name=":8722", sourceType="mel", noreturn=False, echoOutput=False, bufferSize=4096)