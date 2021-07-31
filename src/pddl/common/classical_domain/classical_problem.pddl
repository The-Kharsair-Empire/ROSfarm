(define (problem initial-state) (:domain c-d-farmbot)
(:objects 
    home A1 A2 A3 A4 A5 A6 A7 A8 A9 B1 B2 B3 B4 B5 B6 B7 B8 B9 - position
    carrotSeed1 carrotSeed2 carrotSeed3 carrotSeed4 carrotSeed5 carrotSeed6 carrotSeed7 carrotSeed8 - seed
    carrot basil parsley - plant
)

(:init
    ; (farmbot-functioning)
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
    (container-has seedtray carrotSeed1)  
    (container-has seedtray carrotSeed2)   
    (container-has seedtray carrotSeed3)                               
    (container-has seedtray carrotSeed4)   
    (container-has seedtray carrotSeed5)   
    (container-has seedtray carrotSeed6)   
    (container-has seedtray carrotSeed7)   
    (container-has seedtray carrotSeed8)   
 

    (bin-at posBin seedbin)

    (match-seed-type-n-plant-type carrotSeed1 carrot)
    (match-seed-type-n-plant-type carrotSeed2 carrot)
    (match-seed-type-n-plant-type carrotSeed3 carrot)
    (match-seed-type-n-plant-type carrotSeed4 carrot)
    (match-seed-type-n-plant-type carrotSeed5 carrot)
    (match-seed-type-n-plant-type carrotSeed6 carrot)
    (match-seed-type-n-plant-type carrotSeed7 carrot)
    (match-seed-type-n-plant-type carrotSeed8 carrot)


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
