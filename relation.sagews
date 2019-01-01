#Kinorányi Dóra, relation
class Relation:

    my_list_nums = []
    my_list_pairs = []

    def __init__(self,my_list_nums,my_list_pairs):
        self.my_list_nums = my_list_nums
        self.my_list_pairs = my_list_pairs
    def isReflexive(self):

        a = 0
        answer = False
        for n in self.my_list_nums:
            temp = 0
            for m in self.my_list_pairs:
                if n == m[0] and m[0] == m[1]:
                    temp += 1
            if temp != 0:
                a += 1
        if a == len(self.my_list_nums):
            answer = True
        print answer

    def isAntiSymmetric(self):

        answer = True
        var = 0
        for n in self.my_list_pairs:
            temp = n
            for m in range(var+1,len(self.my_list_pairs)):
                if temp[0] == self.my_list_pairs[m][1] and temp[1] == self.my_list_pairs[m][0] and temp[0] != temp[1]:
                    answer = False
        print answer

    def isTransitive(self):

        answer = True
        for n in self.my_list_pairs:
            for m in self.my_list_pairs:
                if m[0] == n[1]:
                    temp = 0
                    for q in self.my_list_pairs:
                        if q[0]==n[0] and q[1]==m[1]:
                            temp += 1
                    if temp == 0:
                        answer = False
        print answer

rel = Relation([1, 3, 4, 5, 6],[[6,6],[2,2],[1,2],[1,3],[2,3],[4,5]])

rel.isReflexive()
rel.isAntiSymmetric()
rel.isTransitive()




