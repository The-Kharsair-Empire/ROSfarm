(define (problem p-check-need-watering-all-plants) (:domain d-farmbot)
(:objects 
    plantA plantB plantC plantD - plant
    A1 A2 A3 A4 posE posF home - position
    carrot basil parsley - plant
)

(:init
    (farmbot-at home)
    (farmbot-functioning)
    (tool-mount-free)
    (tool-at soilsensorPos soilsensor)
    (tool-rack-at soilsensorrack soilsensor soilsensorPos)
    

    (plant-at A1 carrot )
    (plant-at A2 basil )
    (plant-at A3 carrot )
    (plant-at A4 parsley )

    
)

(:goal (and
    
    (checked-moisture A1 carrot)
    (checked-moisture A2 basil)
    (checked-moisture A3 carrot)
    (checked-moisture A4 parsley)
    (tool-mount-free)
    (farmbot-at home)

    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
