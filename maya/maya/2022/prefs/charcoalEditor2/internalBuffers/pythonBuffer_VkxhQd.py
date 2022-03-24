from maya import cmds
import copy

box = cmds.polyCube()[0]
sphere = cmds.polySphere()[0]

box_translate = cmds.xform(box, translation = True, query=True, ws=True)
sphere_translate = cmds.xform(sphere, translation = True, query=True, os=True)

new_pos = copy.copy(sphere_translate)
new_pos[0] = box_translate[0]

cmds.xform(sphere, translation = new_pos, os=True)

cmds.xform(sphere, translation = sphere_translate, os=True)

print(box_translate)


import maya.cmds as cmds

cmds.commandPort(name=":8722",
                 sourceType="mel",
                 noreturn=False,
                 echoOutput=False,
                 bufferSize=4096)
