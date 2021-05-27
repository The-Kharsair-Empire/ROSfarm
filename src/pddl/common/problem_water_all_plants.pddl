(define (problem p-watering-all-plants) (:domain d-farmbot)
(:objects 
    plantA plantA_2 plantB plantC plantD - plants
    posA posB posC posD posE posF posInit - position
)

(:init
    (farmbot-at posInit)
    (plant-at plantA posA)
    (plant-at plantA_2 posA)
    (plant-at plantB posB)
    (plant-at plantC posC)
    (plant-at plantD posD)
    (not-watered plantA)
    (not-watered plantA_2)
    (not-watered plantB)
    (not-watered plantC)
    (not-watered plantD)
    (moisture-level plantA low)
    (moisture-level plantA_2 low)
    (moisture-level plantB low)
    (moisture-level plantC low)
    (moisture-level plantD low)
    
)

(:goal (and
    
    (watered plantA)
    (watered plantA_2)
    (watered plantB)
    (watered plantC)
    (watered plantD)

    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
