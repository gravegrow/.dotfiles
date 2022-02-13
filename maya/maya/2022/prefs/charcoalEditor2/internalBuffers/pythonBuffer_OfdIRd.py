from maya import cmds

key = "key_cut_00"

for obj in cmds.ls(sl=True):
    new = cmds.duplicate(key)[0]
    xform = cmds.xform(obj, q=True, m=True)
    cmds.xform(new, m=xform)
