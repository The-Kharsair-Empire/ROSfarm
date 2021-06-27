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
Number of literals: 64
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Have identified that bigger values of (remaining-seed seedtray carrotseed) are preferable
Have identified that bigger values of (remaining-seed seedtray basilseed) are preferable
Have identified that bigger values of (remaining-seed seedtray parsleyseed) are preferable
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
Initial heuristic = 7.000
b (6.000 | 0.000)b (5.000 | 0.000)b (4.000 | 0.000)b (3.000 | 0.003)b (2.000 | 0.004)b (1.000 | 0.006)
; Plan found with metric 0.007
; States evaluated so far: 20
; Time 0.03
0.000: (skip_water_plant a1 carrot)  [0.001]
0.000: (skip_water_plant a5 carrot)  [0.001]
0.000: (skip_water_plant a6 parsley)  [0.001]
0.000: (move home wateringnozzlepos)  [0.001]
0.001: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.002: (move wateringnozzlepos a3)  [0.001]
0.003: (water_plant a3 basil)  [0.001]
0.004: (move a3 home)  [0.001]
0.005: (move home wateringnozzlepos)  [0.001]
0.006: (put_down_tool wateringnozzlepos wateringnozzle wateringnozzlerack)  [0.001]
0.007: (move wateringnozzlepos home)  [0.001]

 * All goal deadlines now no later than 0.007

Resorting to best-first search
b (6.000 | 0.000)b (5.000 | 0.000)b (4.000 | 0.000)b (3.000 | 0.003)b (2.000 | 0.004)b (1.000 | 0.005)
; Plan found with metric 0.006
; States evaluated so far: 160
; Time 0.05
0.000: (skip_water_plant a1 carrot)  [0.001]
0.000: (skip_water_plant a5 carrot)  [0.001]
0.000: (skip_water_plant a6 parsley)  [0.001]
0.000: (move home wateringnozzlepos)  [0.001]
0.001: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.002: (move wateringnozzlepos a3)  [0.001]
0.003: (water_plant a3 basil)  [0.001]
0.004: (move a3 wateringnozzlepos)  [0.001]
0.005: (put_down_tool wateringnozzlepos wateringnozzle wateringnozzlerack)  [0.001]
0.006: (move wateringnozzlepos home)  [0.001]

 * All goal deadlines now no later than 0.006
