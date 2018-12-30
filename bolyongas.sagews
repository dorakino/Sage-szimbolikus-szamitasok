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

    P += line([temp, (q,r)], color='purple')
P += point((mxvisx, mxvisy), color='red', pointsize=20)
print "It was farthest from origin at the",fstep,". step"
print "Most visited place: (", mxvisx ,",", mxvisy,  ") visited", mxvis, "times."
print "Visited origin", ornum, "times"

P.show(ymin=ymn*1.2-5, ymax=ymx*1.2+5, xmin=xmn*1.2-5,xmax=xmx*1.2+5,axes=True, aspect_ratio=1)