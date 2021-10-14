(define (problem task)
(:domain c-d-farmbot)
(:objects
    home pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10 pos11 pos12 pos13 pos14 pos15 seederpos wateringnozzlepos weederpos soilsensorpos posseedtray posbin - position
    carrot - plant
    seed1 seed2 seed3 seed4 seed5 seed6 seed7 seed8 seed9 seed10 seed11 seed12 seed13 seed14 seed15 - seed
    seeder wateringnozzle weeder soilsensor - tool
    seederrack wateringnozzlerack weederrack soilsensorrack - toolrack
    low high - level
    seedtray - container
    seedbin - bin
)
(:init
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

    (no-plant-at pos1)
    (no-plant-at pos2)
    (no-plant-at pos3)
    (no-plant-at pos4)
    (no-plant-at pos5)
    (no-plant-at pos6)
    (no-plant-at pos7)
    (no-plant-at pos8)
    (no-plant-at pos9)
    (no-plant-at pos10)
    (no-plant-at pos11)
    (no-plant-at pos12)
    (no-plant-at pos13)
    (no-plant-at pos14)
    (no-plant-at pos15)







    (seeder-free)

    (container-at posseedtray seedtray)

    (container-has seedtray seed1)
    (container-has seedtray seed2)
    (container-has seedtray seed3)
    (container-has seedtray seed4)
    (container-has seedtray seed5)
    (container-has seedtray seed6)
    (container-has seedtray seed7)
    (container-has seedtray seed8)
    (container-has seedtray seed9)
    (container-has seedtray seed10)
    (container-has seedtray seed11)
    (container-has seedtray seed12)
    (container-has seedtray seed13)
    (container-has seedtray seed14)
    (container-has seedtray seed15)

    (match-seed-type-n-plant-type seed1 carrot)
    (match-seed-type-n-plant-type seed2 carrot)
    (match-seed-type-n-plant-type seed3 carrot)
    (match-seed-type-n-plant-type seed4 carrot)
    (match-seed-type-n-plant-type seed5 carrot)
    (match-seed-type-n-plant-type seed6 carrot)
    (match-seed-type-n-plant-type seed7 carrot)
    (match-seed-type-n-plant-type seed8 carrot)
    (match-seed-type-n-plant-type seed9 carrot)
    (match-seed-type-n-plant-type seed10 carrot)
    (match-seed-type-n-plant-type seed11 carrot)
    (match-seed-type-n-plant-type seed12 carrot)
    (match-seed-type-n-plant-type seed13 carrot)
    (match-seed-type-n-plant-type seed14 carrot)
    (match-seed-type-n-plant-type seed15 carrot)

    (bin-at posbin seedbin)





)
(:goal (and
    (plant-at pos1 carrot)
    (plant-at pos2 carrot)
    (plant-at pos3 carrot)
    (plant-at pos4 carrot)
    (plant-at pos5 carrot)
    (plant-at pos6 carrot)
    (plant-at pos7 carrot)
    (plant-at pos8 carrot)
    (plant-at pos9 carrot)
    (plant-at pos10 carrot)
    (plant-at pos11 carrot)
    (plant-at pos12 carrot)
    (plant-at pos13 carrot)
    (plant-at pos14 carrot)
    (plant-at pos15 carrot)
))
)
