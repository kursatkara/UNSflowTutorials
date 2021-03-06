using UnsteadyFlowSolvers


alphadef = EldUpDef(45. *pi/180, 0.4, 0.8)

hdef = ConstDef(0.)

udef = ConstDef(1.)

full_kinem = KinemDef(alphadef, hdef, udef)

pvt = 0.0

geometry = "FlatPlate"

lespcrit = [0.11;]

surf = TwoDSurf(geometry, pvt, full_kinem, lespcrit)

curfield = TwoDFlowField()

dtstar = find_tstep(alphadef)

t_tot = 9.

nsteps = Int(round(t_tot/dtstar))+1

startflag = 0

writeflag = 1

writeInterval = t_tot/18.

#delvort = delSpalart(500, 12, 1e-5)
delvort = delNone()

mat, surf, curfield = ldvm(surf, curfield, nsteps, dtstar,startflag, writeflag, writeInterval, delvort)

makeVortPlots2D()

makeForcePlots2D()

cleanWrite()
