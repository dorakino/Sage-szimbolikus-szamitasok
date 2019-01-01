#Kinorányi Dóra, molecule

from sage.plot.plot3d.shapes import Text
from sage.plot.plot3d.shapes import Sphere
from sage.plot.plot3d.shapes2 import Line
from sage.plot.plot3d.shapes import Text
mol_alanine = Graphics()
temp = Graphics()

hydrogens = [[2.1243,-0.0920,1.6298],[-1.5376,-1.1552,-1.6934],[2.0613,0.6335,0.1718],[-0.0277,-1.0425,1.3783],[0.0733,1.1716,2.5550],[-0.0396,2.0418,1.0151],[-1.3991,1.0613,1.5830]]
nitrogens = [[1.7374,-0.1422,0.7112]]
oxygens = [[-0.0965,0.5316,-1.5533],[-1.2271,-1.1715,-0.7934]]
carbons = [[0.2575,-0.1205,0.8106],[-0.3039,1.1050,1.5253],[-0.3219,-0.1861,-0.5965]]

connections = []
connections.append([hydrogens[0],nitrogens[0]])
connections.append([nitrogens[0], hydrogens[2]])
connections.append([carbons[0], hydrogens[3]])
connections.append([carbons[1], hydrogens[4]])
connections.append([carbons[1], hydrogens[5]])
connections.append([carbons[1], hydrogens[6]])
connections.append([oxygens[1], hydrogens[1]])
connections.append([carbons[2], oxygens[0]])
connections.append([carbons[2], oxygens[1]])
connections.append([carbons[2], carbons[0]])
connections.append([carbons[1], carbons[0]])
connections.append([carbons[0], nitrogens[0]])


for x in range(len(hydrogens)):
    hydrogens[x][0] = hydrogens[x][0]*10
    hydrogens[x][1] = hydrogens[x][1]*10
    hydrogens[x][2] = hydrogens[x][2]*10

for x in range(len(nitrogens)):
    nitrogens[x][0] = nitrogens[x][0]*10
    nitrogens[x][1] = nitrogens[x][1]*10
    nitrogens[x][2] = nitrogens[x][2]*10

for x in range(len(oxygens)):
    oxygens[x][0] = oxygens[x][0]*10
    oxygens[x][1] = oxygens[x][1]*10
    oxygens[x][2] = oxygens[x][2]*10

for x in range(len(carbons)):
    carbons[x][0] = carbons[x][0]*10
    carbons[x][1] = carbons[x][1]*10
    carbons[x][2] = carbons[x][2]*10

for x in range(len(hydrogens)):
    temp = Sphere(3, color='gray').translate(hydrogens[x][0],hydrogens[x][1],hydrogens[x][2])+Text("H,1.008 u").translate(hydrogens[x][0],hydrogens[x][1],hydrogens[x][2]+3)
    mol_alanine = mol_alanine + temp
for x in range(len(nitrogens)):
    temp = Sphere(5, color='blue').translate(nitrogens[x][0],nitrogens[x][1],nitrogens[x][2]) + Text("N,14.007 u").translate(nitrogens[x][0],nitrogens[x][1],nitrogens[x][2]+5)
    mol_alanine += temp
for x in range(len(oxygens)):
    temp = Sphere(5, color='red').translate(oxygens[x][0],oxygens[x][1],oxygens[x][2]) + Text("O,15.999 u").translate(oxygens[x][0],oxygens[x][1],oxygens[x][2]+5)
    mol_alanine += temp
for x in range(len(carbons)):
    temp += Sphere(5, color='yellow').translate(carbons[x][0],carbons[x][1],carbons[x][2]) + Text("C,12.011 u").translate(carbons[x][0],carbons[x][1],carbons[x][2]+5)
    mol_alanine += temp

for x in range(len(connections)):
    temp = Line([(connections[x][0][0],connections[x][0][1],connections[x][0][2]),(connections[x][1][0],connections[x][1][1],connections[x][1][2])], color="black")
    mol_alanine += temp

mol_alanine.show(spin=1,frame=False)