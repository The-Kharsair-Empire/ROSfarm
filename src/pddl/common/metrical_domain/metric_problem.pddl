(define (problem initial-state) (:domain m-d-farmbot)
(:objects 
    home A1 A2 A3 A4 A5 A6 A7 A8 A9 B1 B2 B3 B4 B5 B6 B7 B8 B9 - position
    carrotSeed basilSeed parsleySeed - seed
    carrot basil parsley - plant
)

(:init

    (farmbot-functioning)
    (farmbot-at home)
    (carry-camera)
    (tool-mount-free)
    (seeder-free)

    (tool-rack-at seederrack seeder seederPos)
    (tool-rack-at wateringnozzlerack wateringnozzle wateringnozzlePos)
    (tool-rack-at weederrack weeder weederPos)
    (tool-rack-at soilsensorrack soilsensor soilsensorPos)

    (tool-at seederPos seeder)
    (tool-at wateringnozzlePos wateringnozzle)
    (tool-at weederPos weeder)
    (tool-at soilsensorPos soilsensor)

    (container-at posSeedTray seedtray)
    (container-has seedtray carrotSeed)                              
    (container-has seedtray basilSeed)
    (container-has seedtray parsleySeed)

    (= (remaining-seed seedtray carrotSeed) 10)
    (= (remaining-seed seedtray basilSeed) 1)
    (= (remaining-seed seedtray parsleySeed) 1)
    (= (total-moving-cost) 0)

    (bin-at posBin seedbin)

    (match-seed-n-plant carrotSeed carrot)
    (match-seed-n-plant basilSeed basil)
    (match-seed-n-plant parsleySeed parsley)

    (no-plant-at A1)
    (no-plant-at A2)
    (no-plant-at A3)
    (no-plant-at A4)
    (no-plant-at A5)
    (no-plant-at A6)
    (no-plant-at A7)
    (no-plant-at A8)
    (no-plant-at A9)

    (no-plant-at B1)
    (no-plant-at B2)
    (no-plant-at B3)
    (no-plant-at B4)
    (no-plant-at B5)
    (no-plant-at B6)
    (no-plant-at B7)
    (no-plant-at B8)
    (no-plant-at B9)

    (= (move-distance A1 A2) 1)
    (= (move-distance A1 A3) 2)
    (= (move-distance A1 A4) 1)
    (= (move-distance A1 A5) 2)
    (= (move-distance A1 A6) 3)
    (= (move-distance A1 A7) 2)
    (= (move-distance A1 A8) 3)
    (= (move-distance A1 A9) 4)
    (= (move-distance A1 B1) 3)
    (= (move-distance A1 B2) 4)
    (= (move-distance A1 B3) 5)
    (= (move-distance A1 B4) 4)
    (= (move-distance A1 B5) 5)
    (= (move-distance A1 B6) 6)
    (= (move-distance A1 B7) 5)
    (= (move-distance A1 B8) 6)
    (= (move-distance A1 B9) 7)
    (= (move-distance A2 A1) 1)
    (= (move-distance A2 A3) 1)
    (= (move-distance A2 A4) 2)
    (= (move-distance A2 A5) 1)
    (= (move-distance A2 A6) 2)
    (= (move-distance A2 A7) 3)
    (= (move-distance A2 A8) 2)
    (= (move-distance A2 A9) 3)
    (= (move-distance A2 B1) 2)
    (= (move-distance A2 B2) 3)
    (= (move-distance A2 B3) 4)
    (= (move-distance A2 B4) 3)
    (= (move-distance A2 B5) 4)
    (= (move-distance A2 B6) 5)
    (= (move-distance A2 B7) 4)
    (= (move-distance A2 B8) 5)
    (= (move-distance A2 B9) 6)
    (= (move-distance A3 A1) 2)
    (= (move-distance A3 A2) 1)
    (= (move-distance A3 A4) 3)
    (= (move-distance A3 A5) 2)
    (= (move-distance A3 A6) 1)
    (= (move-distance A3 A7) 4)
    (= (move-distance A3 A8) 3)
    (= (move-distance A3 A9) 2)
    (= (move-distance A3 B1) 1)
    (= (move-distance A3 B2) 2)
    (= (move-distance A3 B3) 3)
    (= (move-distance A3 B4) 2)
    (= (move-distance A3 B5) 3)
    (= (move-distance A3 B6) 4)
    (= (move-distance A3 B7) 3)
    (= (move-distance A3 B8) 4)
    (= (move-distance A3 B9) 5)
    (= (move-distance A4 A1) 1)
    (= (move-distance A4 A2) 2)
    (= (move-distance A4 A3) 3)
    (= (move-distance A4 A5) 1)
    (= (move-distance A4 A6) 2)
    (= (move-distance A4 A7) 1)
    (= (move-distance A4 A8) 2)
    (= (move-distance A4 A9) 3)
    (= (move-distance A4 B1) 4)
    (= (move-distance A4 B2) 5)
    (= (move-distance A4 B3) 6)
    (= (move-distance A4 B4) 3)
    (= (move-distance A4 B5) 4)
    (= (move-distance A4 B6) 5)
    (= (move-distance A4 B7) 4)
    (= (move-distance A4 B8) 5)
    (= (move-distance A4 B9) 6)
    (= (move-distance A5 A1) 2)
    (= (move-distance A5 A2) 1)
    (= (move-distance A5 A3) 2)
    (= (move-distance A5 A4) 1)
    (= (move-distance A5 A6) 1)
    (= (move-distance A5 A7) 2)
    (= (move-distance A5 A8) 1)
    (= (move-distance A5 A9) 2)
    (= (move-distance A5 B1) 3)
    (= (move-distance A5 B2) 4)
    (= (move-distance A5 B3) 5)
    (= (move-distance A5 B4) 2)
    (= (move-distance A5 B5) 3)
    (= (move-distance A5 B6) 4)
    (= (move-distance A5 B7) 3)
    (= (move-distance A5 B8) 4)
    (= (move-distance A5 B9) 5)
    (= (move-distance A6 A1) 3)
    (= (move-distance A6 A2) 2)
    (= (move-distance A6 A3) 1)
    (= (move-distance A6 A4) 2)
    (= (move-distance A6 A5) 1)
    (= (move-distance A6 A7) 3)
    (= (move-distance A6 A8) 2)
    (= (move-distance A6 A9) 1)
    (= (move-distance A6 B1) 2)
    (= (move-distance A6 B2) 3)
    (= (move-distance A6 B3) 4)
    (= (move-distance A6 B4) 1)
    (= (move-distance A6 B5) 2)
    (= (move-distance A6 B6) 3)
    (= (move-distance A6 B7) 2)
    (= (move-distance A6 B8) 3)
    (= (move-distance A6 B9) 4)
    (= (move-distance A7 A1) 2)
    (= (move-distance A7 A2) 3)
    (= (move-distance A7 A3) 4)
    (= (move-distance A7 A4) 1)
    (= (move-distance A7 A5) 2)
    (= (move-distance A7 A6) 3)
    (= (move-distance A7 A8) 1)
    (= (move-distance A7 A9) 2)
    (= (move-distance A7 B1) 5)
    (= (move-distance A7 B2) 6)
    (= (move-distance A7 B3) 7)
    (= (move-distance A7 B4) 4)
    (= (move-distance A7 B5) 5)
    (= (move-distance A7 B6) 6)
    (= (move-distance A7 B7) 3)
    (= (move-distance A7 B8) 4)
    (= (move-distance A7 B9) 5)
    (= (move-distance A8 A1) 3)
    (= (move-distance A8 A2) 2)
    (= (move-distance A8 A3) 3)
    (= (move-distance A8 A4) 2)
    (= (move-distance A8 A5) 1)
    (= (move-distance A8 A6) 2)
    (= (move-distance A8 A7) 1)
    (= (move-distance A8 A9) 1)
    (= (move-distance A8 B1) 4)
    (= (move-distance A8 B2) 5)
    (= (move-distance A8 B3) 6)
    (= (move-distance A8 B4) 3)
    (= (move-distance A8 B5) 4)
    (= (move-distance A8 B6) 5)
    (= (move-distance A8 B7) 2)
    (= (move-distance A8 B8) 3)
    (= (move-distance A8 B9) 4)
    (= (move-distance A9 A1) 4)
    (= (move-distance A9 A2) 3)
    (= (move-distance A9 A3) 2)
    (= (move-distance A9 A4) 3)
    (= (move-distance A9 A5) 2)
    (= (move-distance A9 A6) 1)
    (= (move-distance A9 A7) 2)
    (= (move-distance A9 A8) 1)
    (= (move-distance A9 B1) 3)
    (= (move-distance A9 B2) 4)
    (= (move-distance A9 B3) 5)
    (= (move-distance A9 B4) 2)
    (= (move-distance A9 B5) 3)
    (= (move-distance A9 B6) 4)
    (= (move-distance A9 B7) 1)
    (= (move-distance A9 B8) 2)
    (= (move-distance A9 B9) 3)
    (= (move-distance B1 A1) 3)
    (= (move-distance B1 A2) 2)
    (= (move-distance B1 A3) 1)
    (= (move-distance B1 A4) 4)
    (= (move-distance B1 A5) 3)
    (= (move-distance B1 A6) 2)
    (= (move-distance B1 A7) 5)
    (= (move-distance B1 A8) 4)
    (= (move-distance B1 A9) 3)
    (= (move-distance B1 B2) 1)
    (= (move-distance B1 B3) 2)
    (= (move-distance B1 B4) 1)
    (= (move-distance B1 B5) 2)
    (= (move-distance B1 B6) 3)
    (= (move-distance B1 B7) 2)
    (= (move-distance B1 B8) 3)
    (= (move-distance B1 B9) 4)
    (= (move-distance B2 A1) 4)
    (= (move-distance B2 A2) 3)
    (= (move-distance B2 A3) 2)
    (= (move-distance B2 A4) 5)
    (= (move-distance B2 A5) 4)
    (= (move-distance B2 A6) 3)
    (= (move-distance B2 A7) 6)
    (= (move-distance B2 A8) 5)
    (= (move-distance B2 A9) 4)
    (= (move-distance B2 B1) 1)
    (= (move-distance B2 B3) 1)
    (= (move-distance B2 B4) 2)
    (= (move-distance B2 B5) 1)
    (= (move-distance B2 B6) 2)
    (= (move-distance B2 B7) 3)
    (= (move-distance B2 B8) 2)
    (= (move-distance B2 B9) 3)
    (= (move-distance B3 A1) 5)
    (= (move-distance B3 A2) 4)
    (= (move-distance B3 A3) 3)
    (= (move-distance B3 A4) 6)
    (= (move-distance B3 A5) 5)
    (= (move-distance B3 A6) 4)
    (= (move-distance B3 A7) 7)
    (= (move-distance B3 A8) 6)
    (= (move-distance B3 A9) 5)
    (= (move-distance B3 B1) 2)
    (= (move-distance B3 B2) 1)
    (= (move-distance B3 B4) 3)
    (= (move-distance B3 B5) 2)
    (= (move-distance B3 B6) 1)
    (= (move-distance B3 B7) 4)
    (= (move-distance B3 B8) 3)
    (= (move-distance B3 B9) 2)
    (= (move-distance B4 A1) 4)
    (= (move-distance B4 A2) 3)
    (= (move-distance B4 A3) 2)
    (= (move-distance B4 A4) 3)
    (= (move-distance B4 A5) 2)
    (= (move-distance B4 A6) 1)
    (= (move-distance B4 A7) 4)
    (= (move-distance B4 A8) 3)
    (= (move-distance B4 A9) 2)
    (= (move-distance B4 B1) 1)
    (= (move-distance B4 B2) 2)
    (= (move-distance B4 B3) 3)
    (= (move-distance B4 B5) 1)
    (= (move-distance B4 B6) 2)
    (= (move-distance B4 B7) 1)
    (= (move-distance B4 B8) 2)
    (= (move-distance B4 B9) 3)
    (= (move-distance B5 A1) 5)
    (= (move-distance B5 A2) 4)
    (= (move-distance B5 A3) 3)
    (= (move-distance B5 A4) 4)
    (= (move-distance B5 A5) 3)
    (= (move-distance B5 A6) 2)
    (= (move-distance B5 A7) 5)
    (= (move-distance B5 A8) 4)
    (= (move-distance B5 A9) 3)
    (= (move-distance B5 B1) 2)
    (= (move-distance B5 B2) 1)
    (= (move-distance B5 B3) 2)
    (= (move-distance B5 B4) 1)
    (= (move-distance B5 B6) 1)
    (= (move-distance B5 B7) 2)
    (= (move-distance B5 B8) 1)
    (= (move-distance B5 B9) 2)
    (= (move-distance B6 A1) 6)
    (= (move-distance B6 A2) 5)
    (= (move-distance B6 A3) 4)
    (= (move-distance B6 A4) 5)
    (= (move-distance B6 A5) 4)
    (= (move-distance B6 A6) 3)
    (= (move-distance B6 A7) 6)
    (= (move-distance B6 A8) 5)
    (= (move-distance B6 A9) 4)
    (= (move-distance B6 B1) 3)
    (= (move-distance B6 B2) 2)
    (= (move-distance B6 B3) 1)
    (= (move-distance B6 B4) 2)
    (= (move-distance B6 B5) 1)
    (= (move-distance B6 B7) 3)
    (= (move-distance B6 B8) 2)
    (= (move-distance B6 B9) 1)
    (= (move-distance B7 A1) 5)
    (= (move-distance B7 A2) 4)
    (= (move-distance B7 A3) 3)
    (= (move-distance B7 A4) 4)
    (= (move-distance B7 A5) 3)
    (= (move-distance B7 A6) 2)
    (= (move-distance B7 A7) 3)
    (= (move-distance B7 A8) 2)
    (= (move-distance B7 A9) 1)
    (= (move-distance B7 B1) 2)
    (= (move-distance B7 B2) 3)
    (= (move-distance B7 B3) 4)
    (= (move-distance B7 B4) 1)
    (= (move-distance B7 B5) 2)
    (= (move-distance B7 B6) 3)
    (= (move-distance B7 B8) 1)
    (= (move-distance B7 B9) 2)
    (= (move-distance B8 A1) 6)
    (= (move-distance B8 A2) 5)
    (= (move-distance B8 A3) 4)
    (= (move-distance B8 A4) 5)
    (= (move-distance B8 A5) 4)
    (= (move-distance B8 A6) 3)
    (= (move-distance B8 A7) 4)
    (= (move-distance B8 A8) 3)
    (= (move-distance B8 A9) 2)
    (= (move-distance B8 B1) 3)
    (= (move-distance B8 B2) 2)
    (= (move-distance B8 B3) 3)
    (= (move-distance B8 B4) 2)
    (= (move-distance B8 B5) 1)
    (= (move-distance B8 B6) 2)
    (= (move-distance B8 B7) 1)
    (= (move-distance B8 B9) 1)
    (= (move-distance B9 A1) 7)
    (= (move-distance B9 A2) 6)
    (= (move-distance B9 A3) 5)
    (= (move-distance B9 A4) 6)
    (= (move-distance B9 A5) 5)
    (= (move-distance B9 A6) 4)
    (= (move-distance B9 A7) 5)
    (= (move-distance B9 A8) 4)
    (= (move-distance B9 A9) 3)
    (= (move-distance B9 B1) 4)
    (= (move-distance B9 B2) 3)
    (= (move-distance B9 B3) 2)
    (= (move-distance B9 B4) 3)
    (= (move-distance B9 B5) 2)
    (= (move-distance B9 B6) 1)
    (= (move-distance B9 B7) 2)
    (= (move-distance B9 B8) 1)



)

(:goal (and

    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
(:metric minimize 
    (total-moving-cost)
    
    )
)