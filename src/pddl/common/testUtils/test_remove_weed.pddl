(define (problem initial-state) (:domain c-d-farmbot)
(:objects 
    home A1 A2 A3 A4 A5 A6 A7 A8 A9 B1 B2 B3 B4 B5 B6 B7 B8 B9 - position
    carrotSeed basilSeed parsleySeed - seed
    carrot basil parsley - plant
    w1 w2 w3 w4 s5 w6 - weed
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

    (bin-at posBin seedbin)

    (match-seed-type-n-plant-type carrotSeed carrot)
    (match-seed-type-n-plant-type basilSeed basil)
    (match-seed-type-n-plant-type parsleySeed parsley)

    ; (no-plant-at A1)
    ; (no-plant-at A2)
    ; (no-plant-at A3)
    ; (no-plant-at A4)
    ; (no-plant-at A5)
    ; (no-plant-at A6)
    ; (no-plant-at A7)
    ; (no-plant-at A8)
    ; (no-plant-at A9)

    ; (no-plant-at B1)
    ; (no-plant-at B2)
    ; (no-plant-at B3)
    ; (no-plant-at B4)
    ; (no-plant-at B5)
    ; (no-plant-at B6)
    ; (no-plant-at B7)
    ; (no-plant-at B8)
    ; (no-plant-at B9)

    (plant-at A1 carrot)

    (plant-at A5 carrot)

    (plant-at A2 carrot)

    (plant-at A6 carrot)

    (plant-at A7 carrot)


)

(:goal (and
    ; (plant-at A1 carrot)
    ; (plant-at A3 basil)
    ; (plant-at A5 carrot)
    ; (plant-at A6 parsley)
    ; (farmbot-at home)
    ; (tool-mount-free)
    ; (visited A1)
    ; (visited A2)
    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
