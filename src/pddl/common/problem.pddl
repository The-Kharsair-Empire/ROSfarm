(define (problem task)
(:domain c-d-farmbot)
(:objects
    home a1 a2 a3 a4 a5 a6 a7 a8 a9 b1 b2 b3 b4 b5 b6 b7 b8 b9 seederpos wateringnozzlepos weederpos soilsensorpos posseedtray posbin - position
    carrot basil parsley - plant
    carrotseed basilseed parsleyseed - seed
    seeder wateringnozzle weeder soilsensor - tool
    seederrack wateringnozzlerack weederrack soilsensorrack - toolrack
    low high - level
    seedtray - container
    seedbin - bin
)
(:init

    (farmbot-at b4)

    (carry-tool weeder)

    (carry-camera)

    (tool-at seederpos seeder)
    (tool-at soilsensorpos soilsensor)
    (tool-at wateringnozzlepos wateringnozzle)

    (tool-rack-at seederrack seeder seederpos)
    (tool-rack-at wateringnozzlerack wateringnozzle wateringnozzlepos)
    (tool-rack-at weederrack weeder weederpos)
    (tool-rack-at soilsensorrack soilsensor soilsensorpos)

    (no-plant-at a5)
    (no-plant-at a6)
    (no-plant-at a7)
    (no-plant-at a8)
    (no-plant-at a9)
    (no-plant-at b5)
    (no-plant-at b6)
    (no-plant-at b7)
    (no-plant-at b8)
    (no-plant-at b9)

    (plant-at a1 carrot)
    (plant-at a2 carrot)
    (plant-at a3 carrot)
    (plant-at a4 carrot)
    (plant-at b1 carrot)
    (plant-at b2 carrot)
    (plant-at b3 carrot)
    (plant-at b4 carrot)



    (weed-removed b3)
    (weed-removed a1)
    (weed-removed a2)
    (weed-removed a3)
    (weed-removed a4)
    (weed-removed b1)
    (weed-removed b2)
    (weed-removed b4)



    (seeder-free)

    (container-at posseedtray seedtray)

    (container-has seedtray carrotseed)
    (container-has seedtray basilseed)
    (container-has seedtray parsleyseed)

    (match-seed-n-plant carrotseed carrot)
    (match-seed-n-plant basilseed basil)
    (match-seed-n-plant parsleyseed parsley)

    (bin-at posbin seedbin)




    (watered b3 carrot)
    (watered a1 carrot)
    (watered a2 carrot)
    (watered a3 carrot)
    (watered a4 carrot)
    (watered b1 carrot)
    (watered b2 carrot)
    (watered b4 carrot)

    (= (remaining-seed seedtray carrotseed) 10)
    (= (remaining-seed seedtray basilseed) 1)
    (= (remaining-seed seedtray parsleyseed) 1)

)
(:goal (and
    (checked-moisture b1 carrot)
    (checked-moisture b2 carrot)
    (checked-moisture b3 carrot)
    (checked-moisture b4 carrot)
    (checked-moisture a1 carrot)
    (checked-moisture a2 carrot)
    (checked-moisture a3 carrot)
    (checked-moisture a4 carrot)
))
)
