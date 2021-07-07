(define (problem initial-state) (:domain c-d-farmbot)
(:objects 
    home A1 A2 A3 A4 A5 A6 A7 - position
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

    (= (remaining-seed seedtray carrotSeed) 2)
    (= (remaining-seed seedtray basilSeed) 1)
    (= (remaining-seed seedtray parsleySeed) 1)

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
