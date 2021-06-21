(define (problem p-watering-all-plants) (:domain d-farmbot)
(:objects 
    plantA plantB plantC plantD - plant
    posA posB posC posD posE posF  home - position
)

(:init
    (farmbot-at home)
    (tool-mount-free)
    (tool-at wateringnozzlePos wateringnozzle)
    (tool-rack-at wateringnozzlerack wateringnozzle wateringnozzlePos)
    (farmbot-functioning)
    

    (plant-at posA plantA )
    (plant-at posB plantB )
    (plant-at posC plantC )
    (plant-at posD plantD )

    (need-water posB plantB)
    (need-water posC plantC)

    (not-need-water posA plantA)
    (not-need-water posD plantD)
    
    
)

(:goal (and
    
    (watered posA plantA)
    (watered posB plantB)
    (watered posC plantC)
    (watered posD plantD)
    (tool-mount-free)
    (farmbot-at home)

    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
