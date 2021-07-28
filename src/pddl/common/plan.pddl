
ff: parsing domain file
domain 'M-D-FARMBOT' defined
 ... done.
ff: parsing problem file
problem 'TASK' defined
 ... done.


warning: numeric precondition. turning cost-minimizing relaxed plans OFF.

ff: search configuration is Enforced Hill-Climbing, then A*epsilon with weight 5.
Metric is ((1.00*[RF0](TOTAL-MOVING-COST)) - () + 0.00)
COST MINIMIZATION DONE (WITHOUT cost-minimizing relaxed plans).

Cueing down from goal distance:   19 into depth [1][2]
                                  18            [1]
                                  17            [1]
                                  16            [1]
                                  15            [1]
                                  14            [1]
                                  13            [1]
                                  12            [1]
                                  11            [1]
                                  10            [1]
                                   9            [1]
                                   8            [1]
                                   7            [1]
                                   6            [1]
                                   5            [1]
                                   4            [1]
                                   3            [1]
                                   2            [1]
                                   1            [1]
                                   0            

ff: found legal plan as follows
step    0: MOVE A4 WEEDERPOS
        1: PUT_DOWN_TOOL WEEDERPOS WEEDER WEEDERRACK
        2: MOVE WEEDERPOS SOILSENSORPOS
        3: PICK_UP_TOOL SOILSENSORPOS SOILSENSOR
        4: MOVE SOILSENSORPOS B1
        5: CHECK_NEED_WATER B1 CARROT
        6: MOVE B1 B2
        7: CHECK_NEED_WATER B2 CARROT
        8: MOVE B2 B3
        9: CHECK_NEED_WATER B3 CARROT
       10: MOVE B3 B4
       11: CHECK_NEED_WATER B4 CARROT
       12: MOVE B4 A1
       13: CHECK_NEED_WATER A1 CARROT
       14: MOVE A1 A2
       15: CHECK_NEED_WATER A2 CARROT
       16: MOVE A2 A3
       17: CHECK_NEED_WATER A3 CARROT
       18: MOVE A3 A4
       19: CHECK_NEED_WATER A4 CARROT
plan cost: 54.000000

time spent:    0.00 seconds instantiating 910 easy, 0 hard action templates
               0.00 seconds reachability analysis, yielding 165 facts and 707 actions
               0.00 seconds creating final representation with 157 relevant facts, 4 relevant fluents
               0.00 seconds computing LNF
               0.00 seconds building connectivity graph
               0.00 seconds searching, evaluating 65 states, to a max depth of 2
               0.00 seconds total time

