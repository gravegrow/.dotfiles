def matrixCosstraint(parenting = False):
    driver = cmds.ls(sl=True)[0]
    driven = cmds.ls(sl=True)[1]

    mtrxDecom = cmds.shadingNode('decomposeMatrix', asUtility = True, name = driver + '_wSrt')

    if parenting:
        mtrxMult = cmds.shadingNode('multMatrix', asUtility = True, name = driver + '_mtrxFramed')
        cmds.connectAttr((driver + '.worldMatrix[0]'), (mtrxMult + '.matrixIn[0]'), force = True)
        cmds.connectAttr((driven + '.parentInverseMatrix[0]'), (mtrxMult + '.matrixIn[1]'), force = True)
        cmds.connectAttr((mtrxMult + '.matrixSum'), (mtrxDecom + '.inputMatrix'), force = True)

    else:
        cmds.connectAttr((driver + '.worldMatrix[0]'), (mtrxDecom + '.inputMatrix'), force = True)

    cmds.connectAttr((mtrxDecom + '.outputTranslate'), (driven +'.translate'), force = True)
    cmds.connectAttr((mtrxDecom + '.outputRotate'), (driven +'.rotate'), force = True)
    cmds.connectAttr((mtrxDecom + '.outputScale'), (driven +'.scale'), force = True)

matrixCosstraint()