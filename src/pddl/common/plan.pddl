Warnings encountered when parsing Domain/Problem File

Errors: 0, warnings: 18
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: seederpos
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: wateringnozzlepos
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: weederpos
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: soilsensorpos
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: posseedtray
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: posbin
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: seeder
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: wateringnozzle
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: weeder
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: soilsensor
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: seederrack
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: wateringnozzlerack
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: weederrack
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: soilsensorrack
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 9: Warning: Re-declaration of symbol in same scope: low
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 9: Warning: Re-declaration of symbol in same scope: high
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 10: Warning: Re-declaration of symbol in same scope: seedtray
/home/kharsair/ROSfarm/src/pddl/common/problem.pddl: line: 11: Warning: Re-declaration of symbol in same scope: seedbin
Number of literals: 166
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Have identified that bigger values of (remaining-seed seedtray carrotseed) are preferable
Have identified that bigger values of (remaining-seed seedtray basilseed) are preferable
Have identified that bigger values of (remaining-seed seedtray parsleyseed) are preferable
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
Initial heuristic = 17.000
b (16.000 | 0.001)b (15.000 | 0.002)b (14.000 | 0.003)b (13.000 | 0.004)b (12.000 | 0.005)b (11.000 | 0.006)b (10.000 | 0.007)b (9.000 | 0.008)b (8.000 | 0.009)b (7.000 | 0.010)b (6.000 | 0.011)b (5.000 | 0.012)b (4.000 | 0.013)b (3.000 | 0.014)b (2.000 | 0.015)b (1.000 | 0.016)
; Plan found with metric 0.017
; States evaluated so far: 54
; Time 0.02
0.000: (move b3 weederpos)  [0.001]
0.001: (pick_up_tool weederpos weeder)  [0.001]
0.002: (move weederpos b3)  [0.001]
0.003: (remove_weed b3)  [0.001]
0.004: (move b3 a1)  [0.001]
0.005: (remove_weed a1)  [0.001]
0.006: (move a1 a2)  [0.001]
0.007: (remove_weed a2)  [0.001]
0.008: (move a2 a3)  [0.001]
0.009: (remove_weed a3)  [0.001]
0.010: (move a3 a4)  [0.001]
0.011: (remove_weed a4)  [0.001]
0.012: (move a4 b1)  [0.001]
0.013: (remove_weed b1)  [0.001]
0.014: (move b1 b2)  [0.001]
0.015: (remove_weed b2)  [0.001]
0.016: (move b2 b4)  [0.001]
0.017: (remove_weed b4)  [0.001]

 * All goal deadlines now no later than 0.017

Resorting to best-first search
b (16.000 | 0.001)b (15.000 | 0.002)b (14.000 | 0.003)b (13.000 | 0.004)b (12.000 | 0.005)b (11.000 | 0.006)b (10.000 | 0.007)b (9.000 | 0.008)b (8.000 | 0.009)b (7.000 | 0.010)b (6.000 | 0.011)b (5.000 | 0.012)b (4.000 | 0.013)b (3.000 | 0.014)b (2.000 | 0.015)b (1.000 | 0.016)