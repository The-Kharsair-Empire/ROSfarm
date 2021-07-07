Warnings encountered when parsing Domain/Problem File

Errors: 0, warnings: 18
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: seederpos
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: wateringnozzlepos
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: weederpos
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: soilsensorpos
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: posseedtray
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 4: Warning: Re-declaration of symbol in same scope: posbin
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: seeder
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: wateringnozzle
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: weeder
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 7: Warning: Re-declaration of symbol in same scope: soilsensor
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: seederrack
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: wateringnozzlerack
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: weederrack
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 8: Warning: Re-declaration of symbol in same scope: soilsensorrack
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 9: Warning: Re-declaration of symbol in same scope: low
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 9: Warning: Re-declaration of symbol in same scope: high
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 10: Warning: Re-declaration of symbol in same scope: seedtray
/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/problem.pddl: line: 11: Warning: Re-declaration of symbol in same scope: seedbin
Number of literals: 90
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Have identified that bigger values of (remaining-seed seedtray carrotseed) are preferable
Have identified that bigger values of (remaining-seed seedtray basilseed) are preferable
Have identified that bigger values of (remaining-seed seedtray parsleyseed) are preferable
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
Initial heuristic = 14.000
b (13.000 | 0.000)b (12.000 | 0.002)b (11.000 | 0.003)b (10.000 | 0.006)b (9.000 | 0.007)b (8.000 | 0.008)b (7.000 | 0.011)b (6.000 | 0.013)b (5.000 | 0.016)b (4.000 | 0.017)b (3.000 | 0.018)b (2.000 | 0.020)b (1.000 | 0.021)
; Plan found with metric 0.022
; States evaluated so far: 41
; Time 0.04
0.000: (move home a1)  [0.001]
0.001: (move a1 seederpos)  [0.001]
0.002: (pick_up_tool seederpos seeder)  [0.001]
0.003: (move seederpos a1)  [0.001]
0.004: (move a1 posseedtray)  [0.001]
0.005: (pick_up_seed posseedtray basilseed seedtray)  [0.001]
0.006: (move posseedtray a3)  [0.001]
0.007: (place_seed a3 basilseed basil)  [0.001]
0.008: (move a3 a1)  [0.001]
0.009: (move a1 posseedtray)  [0.001]
0.010: (pick_up_seed posseedtray carrotseed seedtray)  [0.001]
0.011: (move posseedtray a1)  [0.001]
0.012: (place_seed a1 carrotseed carrot)  [0.001]
0.013: (move a1 a5)  [0.001]
0.014: (move a5 posseedtray)  [0.001]
0.015: (pick_up_seed posseedtray carrotseed seedtray)  [0.001]
0.016: (move posseedtray a5)  [0.001]
0.017: (place_seed a5 carrotseed carrot)  [0.001]
0.018: (move a5 a6)  [0.001]
0.019: (move a6 posseedtray)  [0.001]
0.020: (pick_up_seed posseedtray parsleyseed seedtray)  [0.001]
0.021: (move posseedtray a6)  [0.001]
0.022: (place_seed a6 parsleyseed parsley)  [0.001]

 * All goal deadlines now no later than 0.022

Resorting to best-first search
b (13.000 | 0.000)b (12.000 | 0.001)b (11.000 | 0.002)b (10.000 | 0.004)b (9.000 | 0.005)b (8.000 | 0.006)b (7.000 | 0.008)b (6.000 | 0.010)b (5.000 | 0.012)b (4.000 | 0.013)b (3.000 | 0.014)b (2.000 | 0.015)b (1.000 | 0.016)
; Plan found with metric 0.017
; States evaluated so far: 380
; Time 0.13
0.000: (move home seederpos)  [0.001]
0.001: (pick_up_tool seederpos seeder)  [0.001]
0.002: (move seederpos posseedtray)  [0.001]
0.003: (pick_up_seed posseedtray basilseed seedtray)  [0.001]
0.004: (move posseedtray a3)  [0.001]
0.005: (place_seed a3 basilseed basil)  [0.001]
0.006: (move a3 posseedtray)  [0.001]
0.007: (pick_up_seed posseedtray carrotseed seedtray)  [0.001]
0.008: (move posseedtray a1)  [0.001]
0.009: (place_seed a1 carrotseed carrot)  [0.001]
0.010: (move a1 posseedtray)  [0.001]
0.011: (pick_up_seed posseedtray carrotseed seedtray)  [0.001]
0.012: (move posseedtray a5)  [0.001]
0.013: (place_seed a5 carrotseed carrot)  [0.001]
0.014: (move a5 posseedtray)  [0.001]
0.015: (pick_up_seed posseedtray parsleyseed seedtray)  [0.001]
0.016: (move posseedtray a6)  [0.001]
0.017: (place_seed a6 parsleyseed parsley)  [0.001]

 * All goal deadlines now no later than 0.017
