MACHINE 
MCH_PRE_BC_OPERATION_operation1_PATH9
ASSERTIONS
#(xx, yy, zz).(not((yy) - zz > 0) & not(((xx-yy)*2) > 0) & not(((yy) ** 2) + ((xx-yy)*2) ** 2 >= 100) & not((yy) + zz > 100) & not(xx > yy) & (xx : NAT & yy : NAT & zz : NAT))

END