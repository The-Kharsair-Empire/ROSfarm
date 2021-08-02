(define (problem task)
(:domain c-d-farmbot)
(:objects
    home a1 a2 a3 a4 a5 a6 a7 a8 a9 b1 b2 b3 b4 b5 b6 b7 b8 b9 seederpos wateringnozzlepos weederpos soilsensorpos posseedtray posbin - position
    carrot basil parsley - plant
    carrotseed1 carrotseed2 carrotseed3 carrotseed4 carrotseed5 carrotseed6 carrotseed7 carrotseed8 - seed
    seeder wateringnozzle weeder soilsensor - tool
    seederrack wateringnozzlerack weederrack soilsensorrack - toolrack
    low high - level
    seedtray - container
    seedbin - bin
)
(:init

    (farmbot-at a1)

    (carry-tool seeder)

    (carry-camera)

    (tool-at wateringnozzlepos wateringnozzle)
    (tool-at weederpos weeder)
    (tool-at soilsensorpos soilsensor)

    (tool-rack-at seederrack seeder seederpos)
    (tool-rack-at wateringnozzlerack wateringnozzle wateringnozzlepos)
    (tool-rack-at weederrack weeder weederpos)
    (tool-rack-at soilsensorrack soilsensor soilsensorpos)

    (no-plant-at a5)
    (no-plant-at a6)
    (no-plant-at a7)
    (no-plant-at a8)
    (no-plant-at a9)
    (no-plant-at b1)
    (no-plant-at b2)
    (no-plant-at b3)
    (no-plant-at b4)
    (no-plant-at b5)
    (no-plant-at b6)
    (no-plant-at b7)
    (no-plant-at b8)
    (no-plant-at b9)

    (plant-at a4 carrot)
    (plant-at a3 carrot)
    (plant-at a2 carrot)
    (plant-at a1 carrot)






    (seeder-free)

    (container-at posseedtray seedtray)

    (container-has seedtray carrotseed1)
    (container-has seedtray carrotseed2)
    (container-has seedtray carrotseed4)
    (container-has seedtray carrotseed8)

    (match-seed-type-n-plant-type carrotseed1 carrot)
    (match-seed-type-n-plant-type carrotseed2 carrot)
    (match-seed-type-n-plant-type carrotseed3 carrot)
    (match-seed-type-n-plant-type carrotseed4 carrot)
    (match-seed-type-n-plant-type carrotseed5 carrot)
    (match-seed-type-n-plant-type carrotseed6 carrot)
    (match-seed-type-n-plant-type carrotseed7 carrot)
    (match-seed-type-n-plant-type carrotseed8 carrot)

    (bin-at posbin seedbin)





)
(:goal (and
    (plant-at b1 carrot)
    (plant-at b2 carrot)
    (plant-at b3 carrot)
    (plant-at b4 carrot)
))
)
