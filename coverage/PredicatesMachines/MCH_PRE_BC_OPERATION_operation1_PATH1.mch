MACHINE 
MCH_PRE_BC_OPERATION_operation1_PATH1
ASSERTIONS
#(xx, yy, zz).((yy) - zz > 0 & not(((xx*zz)+1) > 0) & ((yy) ** 2) + ((xx-yy)*2) ** 2 >= 100 & not((yy) + zz > 100) & not(xx > yy) & (xx : NAT & yy : NAT & zz : NAT))

END