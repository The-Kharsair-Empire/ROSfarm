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
Number of literals: 78
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Have identified that bigger values of (remaining-seed seedtray carrotseed) are preferable
Have identified that bigger values of (remaining-seed seedtray basilseed) are preferable
Have identified that bigger values of (remaining-seed seedtray parsleyseed) are preferable
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
Initial heuristic = 10.000
b (9.000 | 0.000)b (8.000 | 0.000)b (7.000 | 0.000)b (6.000 | 0.002)b (5.000 | 0.003)b (4.000 | 0.005)b (3.000 | 0.006)b (2.000 | 0.007)b (1.000 | 0.008)
; Plan found with metric 0.009
; States evaluated so far: 23
; Time 0.04
0.000: (move a5 a1)  [0.001]
0.000: (skip_water_plant a3 basil)  [0.001]
0.000: (skip_water_plant a5 carrot)  [0.001]
0.001: (move a1 soilsensorpos)  [0.001]
0.002: (put_down_tool soilsensorpos soilsensor soilsensorrack)  [0.001]
0.003: (move soilsensorpos a1)  [0.001]
0.004: (move a1 wateringnozzlepos)  [0.001]
0.005: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.006: (move wateringnozzlepos a1)  [0.001]
0.007: (water_plant a1 carrot)  [0.001]
0.008: (move a1 a6)  [0.001]
0.009: (water_plant a6 parsley)  [0.001]

 * All goal deadlines now no later than 0.009

Resorting to best-first search
b (9.000 | 0.000)b (8.000 | 0.000)b (7.000 | 0.000)b (6.000 | 0.002)b (5.000 | 0.003)b (4.000 | 0.004)b (3.000 | 0.005)b (2.000 | 0.006)b (1.000 | 0.007)
; Plan found with metric 0.008
; States evaluated so far: 178
; Time 0.07
0.000: (move a5 a1)  [0.001]
0.000: (skip_water_plant a3 basil)  [0.001]
0.000: (skip_water_plant a5 carrot)  [0.001]
0.001: (move a1 soilsensorpos)  [0.001]
0.002: (put_down_tool soilsensorpos soilsensor soilsensorrack)  [0.001]
0.003: (move soilsensorpos wateringnozzlepos)  [0.001]
0.004: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.005: (move wateringnozzlepos a1)  [0.001]
0.006: (water_plant a1 carrot)  [0.001]
0.007: (move a1 a6)  [0.001]
0.008: (water_plant a6 parsley)  [0.001]

 * All goal deadlines now no later than 0.008

; Plan found with metric 0.007
; States evaluated so far: 1628
; Time 0.38
0.000: (move a5 soilsensorpos)  [0.001]
0.000: (skip_water_plant a3 basil)  [0.001]
0.000: (skip_water_plant a5 carrot)  [0.001]
0.001: (put_down_tool soilsensorpos soilsensor soilsensorrack)  [0.001]
0.002: (move soilsensorpos wateringnozzlepos)  [0.001]
0.003: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.004: (move wateringnozzlepos a1)  [0.001]
0.005: (water_plant a1 carrot)  [0.001]
0.006: (move a1 a6)  [0.001]
0.007: (water_plant a6 parsley)  [0.001]

 * All goal deadlines now no later than 0.007
b (1.000 | 0.006)