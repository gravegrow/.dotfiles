from maya import cmds

cmds.commandPort(
    name=':8722',
    sourceType='mel',
    noreturn=False,
    echoOutput=False,
    bufferSize=4096,
)

outfile = '/home/gravegrow/maya/output.log'
cmds.cmdFileOutput(open=outfile)
