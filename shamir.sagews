
#shamir secret sharing

import random

print("The secret i want to keep:")
S=input()
print("Number of pieces i want to divide my secret into:")
n=input()
print("the complete secret can be reconstructed from any combination of k pieces of data:")
k=input()
#print("the prime i use: (for example 57646075230343487)")
#myPrime=input()
myListRandom = [] #finally k-1 elements included
myListPoints = [] #finally n elements (1,f(1)),.... included

for i in range(k):
    p = random.randint(1,21)*5
    q = random.randint(1,21)*7
    w = random.randint(1,21)*11
    myListRandom.append(((p+q+w)*13)%myPrime)

for i in range(1, n+1):
    temp = S
    for j in range(1, k):
        temp = temp + i^j*myListRandom[j]
    myListPoints.append([i,temp])
print "single points i give to participants:"
for i in range(n):
    #print(i+1,(myListPoints[i][1])%myPrime)
    print(i+1,(myListPoints[i][1]))


print "Number of points i reconstruct the secret from:"
k=input()
class Point:
    def __init__(self,i):
        self.i = i
        self.x = 0
        self.y = 0

pointList = [Point(i) for i in range(0,k)]
for point in pointList:
    point.x = input()
    point.y = input()

for i in range(k):
    print "x coordinate of",i+1,". point:"
    a = input()
    print "y coordinate of",i+1,". point:"
    b = input()
    pointList.append([a,b])
varList = []
for i in range(k):
    tempVarList = []
    for j in range(k):
        if i==j:
            tempVarList.append(1)
            tempVarList.remove(1)
        else:
            tempVarList.append(pointList[j])
    varList.append(tempVarList)

poliList = []
#for i in range(k):
for i in range(k):
    tenyList = []
    for j in range(k-1):
        poliList.append(1)
        temp = (0-(varList[i][j][0]))/((pointList[i][0])-(varList[i][j][0]))
        poliList[i] = poliList[i]*temp
polynom = 0
for i in range(k):
    polynom = polynom+pointList[i][1]*poliList[i]
print "The secret is: ", polynom






