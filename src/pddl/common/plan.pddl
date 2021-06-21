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
Number of literals: 76
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Have identified that bigger values of (remaining-seed seedtray carrotseed) are preferable
Have identified that bigger values of (remaining-seed seedtray basilseed) are preferable
Have identified that bigger values of (remaining-seed seedtray parsleyseed) are preferable
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
96% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 18.000
b (17.000 | 70.001)b (16.000 | 140.001)b (15.000 | 140.001)b (14.000 | 210.001)b (13.000 | 270.001)b (12.000 | 340.002)b (11.000 | 340.002)b (10.000 | 480.002)b (9.000 | 480.002)b (8.000 | 550.002)b (7.000 | 610.002)b (6.000 | 680.003)b (5.000 | 680.003)b (4.000 | 740.003)b (3.000 | 750.003)b (2.000 | 810.003)b (1.000 | 880.004);;;; Solution Found
; States evaluated: 79
; Cost: 940.004
; Time 0.05
0.000: (move home seederpos)  [60.000]
60.001: (pick_up_tool seederpos seeder)  [10.000]
70.001: (move seederpos posseedtray)  [60.000]
130.001: (pick_up_seed posseedtray basilseed seedtray)  [10.000]
140.001: (move posseedtray a3)  [60.000]
200.001: (place_seed a3 basilseed basil)  [10.000]
210.001: (move a3 a1)  [60.000]
270.002: (move a1 posseedtray)  [60.000]
330.002: (pick_up_seed posseedtray carrotseed seedtray)  [10.000]
340.002: (move posseedtray a1)  [60.000]
400.002: (place_seed a1 carrotseed carrot)  [10.000]
410.002: (move a1 posseedtray)  [60.000]
470.002: (pick_up_seed posseedtray carrotseed seedtray)  [10.000]
480.002: (move posseedtray a5)  [60.000]
540.002: (place_seed a5 carrotseed carrot)  [10.000]
550.002: (move a5 a6)  [60.000]
610.003: (move a6 posseedtray)  [60.000]
670.003: (pick_up_seed posseedtray parsleyseed seedtray)  [10.000]
680.003: (move posseedtray a6)  [60.000]
740.003: (place_seed a6 parsleyseed parsley)  [10.000]
750.003: (move a6 home)  [60.000]
810.004: (move home seederpos)  [60.000]
870.004: (put_down_tool seederpos seeder seederrack)  [10.000]
880.004: (move seederpos home)  [60.000]
