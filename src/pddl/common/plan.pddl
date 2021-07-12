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
Number of literals: 72
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Have identified that bigger values of (remaining-seed seedtray carrotseed) are preferable
Have identified that bigger values of (remaining-seed seedtray basilseed) are preferable
Have identified that bigger values of (remaining-seed seedtray parsleyseed) are preferable
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
Initial heuristic = 13.000
b (12.000 | 0.000)b (11.000 | 0.000)b (10.000 | 0.000)b (9.000 | 0.000)b (8.000 | 0.002)b (7.000 | 0.003)b (6.000 | 0.005)b (5.000 | 0.006)b (4.000 | 0.007)b (3.000 | 0.008)b (2.000 | 0.009)b (1.000 | 0.010)
; Plan found with metric 0.011
; States evaluated so far: 36
; Time 0.00
0.000: (move a6 a1)  [0.001]
0.000: (skip_water_plant a3 basil)  [0.001]
0.000: (skip_water_plant a7 carrot)  [0.001]
0.000: (skip_water_plant a6 parsley)  [0.001]
0.001: (move a1 soilsensorpos)  [0.001]
0.002: (put_down_tool soilsensorpos soilsensor soilsensorrack)  [0.001]
0.003: (move soilsensorpos a1)  [0.001]
0.004: (move a1 wateringnozzlepos)  [0.001]
0.005: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.006: (move wateringnozzlepos a1)  [0.001]
0.007: (water_plant a1 carrot)  [0.001]
0.008: (move a1 a2)  [0.001]
0.009: (water_plant a2 parsley)  [0.001]
0.010: (move a2 a5)  [0.001]
0.011: (water_plant a5 carrot)  [0.001]

 * All goal deadlines now no later than 0.011

Resorting to best-first search
b (12.000 | 0.000)b (11.000 | 0.000)b (10.000 | 0.000)b (9.000 | 0.000)b (8.000 | 0.002)b (7.000 | 0.003)b (6.000 | 0.004)b (5.000 | 0.005)b (4.000 | 0.006)b (3.000 | 0.007)b (2.000 | 0.008)b (1.000 | 0.009)
; Plan found with metric 0.010
; States evaluated so far: 240
; Time 0.04
0.000: (move a6 a1)  [0.001]
0.000: (skip_water_plant a3 basil)  [0.001]
0.000: (skip_water_plant a7 carrot)  [0.001]
0.000: (skip_water_plant a6 parsley)  [0.001]
0.001: (move a1 soilsensorpos)  [0.001]
0.002: (put_down_tool soilsensorpos soilsensor soilsensorrack)  [0.001]
0.003: (move soilsensorpos wateringnozzlepos)  [0.001]
0.004: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.005: (move wateringnozzlepos a1)  [0.001]
0.006: (water_plant a1 carrot)  [0.001]
0.007: (move a1 a2)  [0.001]
0.008: (water_plant a2 parsley)  [0.001]
0.009: (move a2 a5)  [0.001]
0.010: (water_plant a5 carrot)  [0.001]

 * All goal deadlines now no later than 0.010

; Plan found with metric 0.009
; States evaluated so far: 7345
; Time 1.85
0.000: (move a6 soilsensorpos)  [0.001]
0.000: (skip_water_plant a3 basil)  [0.001]
0.000: (skip_water_plant a7 carrot)  [0.001]
0.000: (skip_water_plant a6 parsley)  [0.001]
0.001: (put_down_tool soilsensorpos soilsensor soilsensorrack)  [0.001]
0.002: (move soilsensorpos wateringnozzlepos)  [0.001]
0.003: (pick_up_tool wateringnozzlepos wateringnozzle)  [0.001]
0.004: (move wateringnozzlepos a1)  [0.001]
0.005: (water_plant a1 carrot)  [0.001]
0.006: (move a1 a2)  [0.001]
0.007: (water_plant a2 parsley)  [0.001]
0.008: (move a2 a5)  [0.001]
0.009: (water_plant a5 carrot)  [0.001]

 * All goal deadlines now no later than 0.009
b (1.000 | 0.008)