︠ebe74cf4-7595-4666-9a39-7b4caa79a9a9s︠

import random

P = plot(point((0, 0)))
p = [0,1,2,3,4]
q=0
r=0
ornum=1
maxdis = 0
fstep=0

mxvis=1
mxvisx=0
mxvisy=0

thislist1 = [[0,0,1]]

xmx=0
xmn=0
ymx=0
ymn=0
for i in range(1000):
    if random.choice (p) == 0:
        v=0
        w=0
    elif random.choice (p) == 1:
        v=1
        w=0
    elif random.choice (p) == 2:
        v=-1
        w=0
    elif random.choice (p) == 3:
        v=0
        w=1
    elif random.choice (p) == 4:
        v=0
        w=-1

    temp=(q,r)
    q = q + v
    r = r + w

    if q > xmx:
        xmx = q
    if q < xmn:
        xmn = q
    if r > ymx:
        ymx = r
    if r < ymn:
        ymn = r

    if q == 0 and r == 0:
        ornum = ornum + 1

    if sqrt(q^2+r^2) > maxdis:
        maxdis = sqrt(q^2+r^2)
        fstep=i+1

    tempelem = [q,r,1]
    found = False
    for x in thislist1:
        if x[0] == q and x[1] == r:
            x[2]=x[2]+1
            found = True
    if found == False:
        thislist1.append(tempelem)
    for x in thislist1:
        if x[2] > mxvis:
            mxvis = x[2]
            mxvisx = x[0]
            mxvisy = x[1]

    #P += point((q, r), color='red', pointsize=20)
    P += line([temp, (q,r)], color='purple')
print "It was furthest from origin at the",fstep,". step"
print "most visited place:", mxvisx,mxvisy,  "visited", mxvis, "times."
print "Visited origin", ornum, "times"

P.show(ymin=ymn*1.2-5, ymax=ymx*1.2+5, xmin=xmn*1.2-5,xmax=xmx*1.2+5,axes=True, aspect_ratio=1)
︡361850ef-74ab-49c2-8120-ad05148b950b︡{"stdout":"It was furthest from origin at the 914 . step\n"}︡{"stdout":"most visited place: 57 66 visited 16 times.\n"}︡{"stdout":"Visited origin 1 times\n"}︡{"file":{"filename":"/home/user/.sage/temp/project-d794462b-5ebc-44cc-8c96-fd339505efa0/731/tmp_GEkOqd.svg","show":true,"text":null,"uuid":"00c7952b-59d4-4495-bc19-335d0fc628a4"},"once":false}︡{"done":true}︡
︠0df69c18-6446-4413-b0ac-218fbabb0451︠









