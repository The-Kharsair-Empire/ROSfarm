(define (problem p-plant-seeds) (:domain d-farmbot)
(:objects 
    posA posB posC posInit posT posPA posPB posPC - position
    containerA containerB containerC - container
    seedA seedB seedC - seed
    plantA plantB plantC - plant
)

(:init
    (farmbot-functioning)
    (farmbot-at posInit)
    (tool-mount-free)
    (container-at posA containerA)
    (container-at posB containerB)
    (container-at posC containerC)
    (container-has containerA seedA)
    (container-has containerB seedB)
    (container-has containerC seedC)
    (match-seed-n-plant seedA plantA)
    (match-seed-n-plant seedB plantB)
    (match-seed-n-plant seedC plantC)

    (tool-at posT seeder)
    (tool-rack-at seeder posT)
    (no-plant-at posPA)
    (no-plant-at posPB)
    (no-plant-at posPC)

    ; (farmbot-at posInit)
    ; (carry-tool seeder)
    ; (tool-rack-at seeder posA)


    

    
)

(:goal (and
    (plant-at posPA plantA)
    (plant-at posPB plantB)
    (plant-at posPC plantC)

    ; (tool-mount-free)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
