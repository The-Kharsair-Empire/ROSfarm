(define (problem p-check-need-watering-all-plants) (:domain d-farmbot)
(:objects 
    plantA plantB plantC plantD - plant
    posA posB posC posD posE posF posT posInit posHome - position
)

(:init
    (farmbot-at posHome)
    (tool-mount-free)
    (tool-at posT soil-sensor)
    (tool-rack-at soil-sensor posT)
    

    (plant-at posA plantA )
    (plant-at posB plantB )
    (plant-at posC plantC )
    (plant-at posD plantD )

    (not-checked-moisture plantA)
    (not-checked-moisture plantB)
    (not-checked-moisture plantC)
    (not-checked-moisture plantD)
    
)

(:goal (and
    
    (checked-moisture plantA)
    (checked-moisture plantB)
    (checked-moisture plantC)
    (checked-moisture plantD)
    (tool-mount-free)
    (farmbot-at posHome)

    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
