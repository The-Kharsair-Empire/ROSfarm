(define (problem p-watering-all-plants) (:domain d-farmbot)
(:objects 
    plantA plantB plantC plantD - plant
    posA posB posC posD posE posF posT posInit posHome - position
)

(:init
    (farmbot-at posHome)
    (tool-mount-free)
    (tool-at posT sprayhead)
    (tool-rack-at sprayhead posT)
    

    (plant-at posA plantA )
    (plant-at posB plantB )
    (plant-at posC plantC )
    (plant-at posD plantD )

    (need-water plantB)
    (need-water plantC)

    (not-need-water plantA)
    (not-need-water plantD)
    
    
)

(:goal (and
    
    (watered plantA)
    (watered plantB)
    (watered plantC)
    (watered plantD)
    (tool-mount-free)
    (farmbot-at posHome)

    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
