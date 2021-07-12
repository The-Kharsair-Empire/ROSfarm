(define (domain t-d-farmbot)

; this domain is tried with popf planner, simple and esterel parser and dispatchers
; esterel dispatcher is not a mush since here we are not having concurrent actions
(:requirements 
    :strips 
    :fluents 
    :durative-actions
    :typing 
    ; :timed-initial-literals 
    :conditional-effects 
    ; :negative-preconditions 
    ; :duration-inequalities 
    ; :equality 
    ; :disjunctive-preconditions
    ; :universal-preconditions
    ; :existential-preconditions

)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    
    position
    plant seed weed - object
    ;sucker sprayhead blade camera sensor container - tool
    tool
    toolrack
    level
    container ; seed container
    bin
    
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (farmbot-functioning)
    (tool-mount-free)
    (farmbot-at ?x - position)
    (carry-tool ?t - tool)
    (visited ?x - position)
    (carry-camera)

    (tool-at ?x - position ?t - tool)
    (tool-rack-at ?tr - toolrack ?t - tool ?x - position)

    (no-plant-at ?x - position)
    (plant-at ?x - position ?p - plant)

    (weed-at ?x - position ?w - weed)

    (carry-seed ?s - seed)
    (seeder-free)

    (container-at ?x - position ?c - container)
    (container-has ?c - container ?s - seed)
    (match-seed-n-plant ?s - seed ?p - plant)

    (bin-at ?x - position ?b - bin)

    (checked-moisture ?x - position ?p - plant)
    (need-water ?x - position ?p - plant)
    (not-need-water ?x - position ?p - plant)
    (watered ?x - position ?p - plant)
)

(:constants
    low high - level
    seeder wateringnozzle weeder soilsensor - tool
    seedtray - container
    seedbin - bin
    seederrack wateringnozzlerack weederrack soilsensorrack - toolrack
    seederPos wateringnozzlePos weederPos soilsensorPos posSeedTray posBin - position
)


(:functions
    (remaining-seed ?c - container ?s - seed)
)

;temporal actions

(:durative-action move
    :parameters (?x ?y - position)
    :duration (= ?duration 60)
    :condition (and 
        (at start (and 
            (farmbot-at ?x)
        ))
        (over all (and 
            (farmbot-functioning)
        ))
    )
    :effect (and 
        (at start (and 
            (not (farmbot-at ?x))
        ))
        (at end (and 
            (farmbot-at ?y)
        ))

        ; delete this after testing
        ; (at end (and
        ;     (visited ?y)
        ; ))
    )
)

(:durative-action pick_up_tool
    :parameters (?x - position ?t - tool)
    :duration (= ?duration 10)
    :condition (and 
        (at start (and 
            (tool-at ?x ?t)
            (tool-mount-free)
        ))
        (over all (and 
            (farmbot-at ?x)
            (farmbot-functioning)
        ))
    )
    :effect (and 
        (at start (and
            (not (tool-mount-free))
        ))

        (at end (and 
            (not (tool-at ?x ?t))
            (carry-tool ?t)
        ))     
    )
)

(:durative-action put_down_tool
    :parameters (?x - position ?t - tool ?tr - toolrack)
    :duration (= ?duration 10)
    :condition (and 
        (at start (and 
            (carry-tool ?t)
        ))
        (over all (and 
            (tool-rack-at ?tr ?t ?x)
            (farmbot-at ?x)
            (farmbot-functioning)
        ))
    )
    :effect (and 
        
        (at start (and
            (not (carry-tool ?t)) ; putting this here instead of in (at end ) will drastically increase the performance of popf planner
        ))
        (at end (and 
            (tool-mount-free)
            (tool-at ?x ?t)
        ))
    )
)


(:durative-action drop_seed
    :parameters (?x - position ?s - seed)
    :duration (= ?duration 10)
    :condition (and 
        (at start (and 
            (bin-at ?x seedbin)
        ))
        (over all (and 
            (farmbot-at ?x)
            (farmbot-functioning)
        ))

    )
    :effect (and 
        (at start (and 
            (seeder-free)
        ))
    )
)


(:durative-action pick_up_seed
    :parameters (?x - position ?s - seed ?c - container)
    :duration (= ?duration 10)
    :condition (and 
        (at start (and 
            (container-has ?c ?s)
            (seeder-free)
            (> (remaining-seed ?c ?s) 0)
        ))
        (over all (and 
            (container-at ?x ?c)
            (farmbot-at ?x)
            (farmbot-functioning)
            (carry-tool seeder)
        ))
    )
    :effect (and 
        (at start (and
            (not (seeder-free))
        ))
        (at end (and 
            (carry-seed ?s)
            (decrease (remaining-seed ?c ?s) 1)
    
        ))
    )
)

(:durative-action place_seed
    :parameters (?x - position ?s - seed ?p - plant)
    :duration (= ?duration 10)
    :condition (and 
        (at start (and 
            (no-plant-at ?x)
            (carry-seed ?s)
        ))
        (over all (and 
            (farmbot-at ?x)
            (match-seed-n-plant ?s ?p)
            (farmbot-functioning)
            (carry-tool seeder)
        ))
    )
    :effect (and 
        (at start (and
            (not (carry-seed ?s))
            (not (no-plant-at ?x))
            (seeder-free)
        ))
        (at end (and 
            (plant-at ?x ?p)      
        ))
    )
)

(:durative-action check_need_water
    :parameters (?x - position ?p - plant)
    :duration (= ?duration 10)
    :condition (and 
        (over all (and 
            (plant-at ?x ?p)
            (farmbot-at ?x)
            (carry-tool soilsensor)
            (farmbot-functioning)
        ))
    )
    :effect (and 
        (at start (and
            (not (watered ?x ?p))
        ))
        (at end (and 
            (checked-moisture ?x ?p)
            
        ))
    )

    ; update the KB in the actual action dispatch and feedback unit
    ; if the need-water predicate needs to be added, based on the result from the moisture sensor
)

(:durative-action water_plant
    :parameters (?x - position ?p - plant)
    :duration (= ?duration 10)
    :condition (and 
        (at start (and 
            (need-water ?x ?p)
        ))
        (over all (and 
            (farmbot-at ?x)
            (plant-at ?x ?p)
            (carry-tool wateringnozzle)
            (farmbot-functioning)
        ))
    )
    :effect (and 
        (at start (and 
            (not (need-water ?x ?p))
            (not (checked-moisture ?x ?p))
        ))
        (at end (and 
            (watered ?x ?p)
        ))
    )
)


(:durative-action skip_water_plant
    :parameters (?x - position ?p - plant)
    :duration (= ?duration 10)
    :condition (and 
        (at start (and 
            (not-need-water ?x ?p)
        ))
        (over all (and 
            (plant-at ?x ?p)
            (farmbot-functioning)
        ))

    )
    :effect (and 
        (at start (and 
            (not (not-need-water ?x ?p)) ; really need this?
            (not (checked-moisture ?x ?p))
        ))
        (at end (and 
            (watered ?x ?p)
        ))
    )
)


; (:action detect_weed
;     :parameters (?x - position ?w - weed)
;     :precondition (and 
;         (carry-tool camera)
;         (farmbot-at ?x)

;     )
;     :effect (and )
; )


)