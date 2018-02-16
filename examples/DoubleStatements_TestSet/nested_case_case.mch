/* nested_case_case
 * Author: Diego Oliveira
 * Creation date: 04/11/2016
 */
MACHINE
    nested_case_case

OPERATIONS
    res1, res2 <-- opnested_case_case(xx, yy)=
    PRE xx : NAT & yy : NAT
    THEN
       CASE xx OF
           EITHER 0 THEN
               CASE yy OF
                   EITHER 0 THEN
                       res1 := xx || res2 := yy
                   OR 1 THEN
                       res1 := xx || res2 := yy
                   ELSE
                       res1 := xx || res2 := yy
                   END
               END
           OR 1 THEN
               CASE yy OF
                   EITHER 0 THEN
                       res1 := xx || res2 := yy
                   OR 1 THEN
                       res1 := xx || res2 := yy
                   ELSE
                       res1 := xx || res2 := yy
                   END
               END
           ELSE
               CASE yy OF
                   EITHER 0 THEN
                       res1 := xx || res2 := yy
                   OR 1 THEN
                       res1 := xx || res2 := yy
                   ELSE
                       res1 := xx || res2 := yy
                   END
               END
           END
       END
   END
END
