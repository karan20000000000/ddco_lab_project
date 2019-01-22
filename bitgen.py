for i in range(0, 16):
    st = "mux8 op_{i}( {{ i0[{i}], i1[{i}], i2[{i}], i3[{i}], i4[{i}], i5[{i}], i6[{i}], i7[{i}] }}, s[0], s[1], s[2], o[{i}] );".format(i=i)
    print(st)
