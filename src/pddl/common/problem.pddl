(define (problem task)
(:domain d-farmbot)
(:objects
    home a1 a2 a3 a4 a5 a6 a7 seederpos wateringnozzlepos weederpos soilsensorpos posseedtray posbin - position
    carrot basil parsley - plant
    carrotseed basilseed parsleyseed - seed
    seeder wateringnozzle weeder soilsensor - tool
    seederrack wateringnozzlerack weederrack soilsensorrack - toolrack
    low high - level
    seedtray - container
    seedbin - bin
)
(:init
    (farmbot-functioning)

    (tool-mount-free)

    (farmbot-at home)



    (carry-camera)

    (tool-at seederpos seeder)
    (tool-at wateringnozzlepos wateringnozzle)
    (tool-at weederpos weeder)
    (tool-at soilsensorpos soilsensor)

    (tool-rack-at seederrack seeder seederpos)
    (tool-rack-at wateringnozzlerack wateringnozzle wateringnozzlepos)
    (tool-rack-at weederrack weeder weederpos)
    (tool-rack-at soilsensorrack soilsensor soilsensorpos)

    (no-plant-at a1)
    (no-plant-at a2)
    (no-plant-at a3)
    (no-plant-at a4)
    (no-plant-at a5)
    (no-plant-at a6)
    (no-plant-at a7)




    (seeder-free)

    (container-at posseedtray seedtray)

    (container-has seedtray carrotseed)
    (container-has seedtray basilseed)
    (container-has seedtray parsleyseed)

    (match-seed-n-plant carrotseed carrot)
    (match-seed-n-plant basilseed basil)
    (match-seed-n-plant parsleyseed parsley)

    (bin-at posbin seedbin)





    (= (remaining-seed seedtray carrotseed) 2)
    (= (remaining-seed seedtray basilseed) 1)
    (= (remaining-seed seedtray parsleyseed) 1)

)
(:goal (and
    (plant-at a1 carrot)
    (plant-at a3 basil)
    (plant-at a5 carrot)
    (plant-at a6 parsley)
    (farmbot-at home)
    (tool-mount-free)
))
)
