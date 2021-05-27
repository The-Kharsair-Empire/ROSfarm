(define (domain d-farmbot)
(:requirements :typing)
(:types        
	plants 
	position 
	weeds
    level
)
(:predicates 
    (not-watered ?p - plants)
    (watered ?p - plants )
	(plant-at ?p - plants ?x - position)
	(need-water ?p -plants )
	(weed-at ?w - weeds ?x - position)
	(farmbot-at ?x - position)
	(moisture-level ?p - plants ?l - level)
    
)

(:constants low high - level)

(:functions
    (moisture ?plt - plants)
)

(:action move
    :parameters (?x ?y - position)
    :precondition (and 
        (farmbot-at ?x)
    )
    :effect (and 
        (farmbot-at ?y)
        (not (farmbot-at ?x))
    )
)

(:action remove-weed
    :parameters (?w - weeds ?x - position)
    :precondition (and 
        (farmbot-at ?x)
        (weed-at ?w ?x)
    )
    :effect (and 
        (not (weed-at ?w ?x))
    )
)

(:action water
    :parameters (?p - plants ?x - position)
    :precondition (and 
        (farmbot-at ?x)
        (plant-at ?p ?x)
        (need-water ?p )
    )
    :effect (and 
        (watered ?p)
        (not (need-water ?p))
        (not (not-watered ?p))
    
    )
)

; (:action skip-watering
;     :parameters (?p -plants ?x - position)
;     :precondition (and
;         (farmbot-at ?x)
;         (plant-at ?p ?x)
        
;      )
;     :effect (and 
;         (watered ?p)
;     )
; )


(:action check-watring-needed
    :parameters (?p -plants ?x - position ?l - level)
    :precondition (and 
        (plant-at ?p ?x)
        (farmbot-at ?x)
        (not-watered ?p)
    )
    :effect (and 
        (when (moisture-level ?p high)
            (and (watered ?p)
            (not (not-watered ?p)))
        )
        (when (moisture-level ?p low)
            (need-water ?p)
        )
               
    )
)

; (:action water
;     :parameters (?p -plants ?x - position)
;     :precondition (and 
;         (farmbot-at ?x)
;         (plant-at ?p -plants ?x)
;         (need-water ?p -plants ?x)
;     )
;     :effect (and 
;         (watered ?p -plants ?x)
;         (not (need-water ?p -plants ?x))
;     )
; )
	

)
