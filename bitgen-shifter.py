def shift(l, amt):
    fl = l[:]
    for i in range(len(l)):
        if(i-amt<0 or i-amt>=len(l)):
            fl[i] = "i[15]"
            continue
        fl[i] = l[i-amt]
    return fl

l = list(range(15, -1, -1))
for i in range(16):
    li = []
    for val in l:
        if val != "i[15]":
            li.append("i[{0}]".format(val))
        else:
            li.append(val)

    str = "mux16 m_{i}( {{ {0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}, {11}, {12}, {13}, {14}, {15} }}, shamt, o[{i}]);".format(i=i, *(li[::-1]))
    l = shift(l, 1)
    print(str)