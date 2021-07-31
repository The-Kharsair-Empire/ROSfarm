(define (domain m-d-farmbot)

; this domain is tried with popf planner, simple and esterel parser and dispatchers
; esterel dispatcher will not work because some action wkll be dispatched concurrently rather than sequentially 
; use simple dispatcher
; the popf is unable to produce optimal plan on the first iteration. However, we can wait for it to iterate on the plan. but it takes time
(:requirements 
    :strips 
    :fluents 
    ; :durative-actions
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
    ;(farmbot-functioning)
    (tool-mount-free)
    (farmbot-at ?x - position)
    (carry-tool ?t - tool)
    ; (visited ?x - position)
    (carry-camera)

    (tool-at ?x - position ?t - tool)
    (tool-rack-at ?tr - toolrack ?t - tool ?x - position)

    (no-plant-at ?x - position)
    (plant-at ?x - position ?p - plant)

    (checked-weed-exist ?x - position)
    (weed-at ?x - position)
    (weed-removed ?x - position)
    (no-weed-at ?x - position)
    

    (carry-seed ?s - seed)
    (seeder-free)

    (container-at ?x - position ?c - container)
    (container-has ?c - container ?s - seed)
    (match-seed-type-n-plant-type ?s - seed ?p - plant)

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
    (remaining-seed ?c - container ?s - seed) - number
    (move-distance ?x - position ?y - position)
    (total-moving-cost) - number
)

(:action move
    :parameters (?x ?y - position)
    :precondition (and 
        (farmbot-at ?x)
        ; (farmbot-functioning)
    )
    :effect (and 
        (not (farmbot-at ?x))
        (farmbot-at ?y)
        (increase (total-moving-cost) (move-distance ?x ?y))
    )
)


(:action pick_up_tool
    :parameters (?x - position ?t - tool)
    :precondition (and 
    
        (tool-at ?x ?t)
        (tool-mount-free)
        (farmbot-at ?x)
        ;(farmbot-functioning)
  
    )
    :effect (and 
      
        (not (tool-mount-free))
        (not (tool-at ?x ?t))
        (carry-tool ?t)

    )
)

(:action put_down_tool
    :parameters (?x - position ?t - tool ?tr - toolrack)
    :precondition (and 
      
        (carry-tool ?t)
        (tool-rack-at ?tr ?t ?x)
        (farmbot-at ?x)
        ;(farmbot-functioning)

    )
    :effect (and 
    
        (not (carry-tool ?t)) 
        (tool-mount-free)
        (tool-at ?x ?t)

    )
)


(:action drop_seed
    :parameters (?x - position ?s - seed)
    :precondition (and 

        (bin-at ?x seedbin)
        (farmbot-at ?x)
       ; (farmbot-functioning)

    )
    :effect (and 

        (seeder-free)

    )
)


(:action pick_up_seed
    :parameters (?x - position ?s - seed ?c - container)
    :precondition (and 

        (container-has ?c ?s)
        (seeder-free)
        (> (remaining-seed ?c ?s) 0)
        (container-at ?x ?c)
        (farmbot-at ?x)
        ; (farmbot-functioning)
        (carry-tool seeder)
    )
    :effect (and 

        (not (seeder-free))
        (carry-seed ?s)
        (decrease (remaining-seed ?c ?s) 1)
    )
)

(:action place_seed
    :parameters (?x - position ?s - seed ?p - plant)
    :precondition (and 
       
        (no-plant-at ?x)
        (carry-seed ?s)

        (farmbot-at ?x)
        (match-seed-type-n-plant-type ?s ?p)
        ; (farmbot-functioning)
        (carry-tool seeder)
 
    )
    :effect (and 

        (not (carry-seed ?s))
        (not (no-plant-at ?x))
        (seeder-free)

    
        (plant-at ?x ?p)      

    )
)

(:action check_need_water
    :parameters (?x - position ?p - plant)
    :precondition (and 

        (plant-at ?x ?p)
        (farmbot-at ?x)
        (carry-tool soilsensor)
        ; (farmbot-functioning)

    )
    :effect (and 
 
        (checked-moisture ?x ?p)
        (not (watered ?x ?p)); this is very important to enable the APP to cycle between two state, otherwise the goal will already be satisfied the second time it comes back to water plan

    )

    ; update the KB in the actual action dispatch and feedback unit
    ; if the need-water predicate needs to be added, based on the result from the moisture sensor
)

(:action water_plant
    :parameters (?x - position ?p - plant)
    :precondition (and 
   
        (need-water ?x ?p)

        (farmbot-at ?x)
        (plant-at ?x ?p)
        (carry-tool wateringnozzle)
        ; (farmbot-functioning)
   
    )
    :effect (and 

        (not (need-water ?x ?p))
        (not (checked-moisture ?x ?p))

        (watered ?x ?p)
   
    )
)


(:action skip_water_plant
    :parameters (?x - position ?p - plant)

    :precondition (and 

        (not-need-water ?x ?p)

        (plant-at ?x ?p)
        ; (farmbot-functioning)
    

    )
    :effect (and 

        (not (not-need-water ?x ?p)) 
        (not (checked-moisture ?x ?p))

        (watered ?x ?p)

    )
)


(:action detect_weed
    :parameters (?x - position)
    :precondition (and 
        (carry-camera)
        (farmbot-at ?x)
        ; (farmbot-functioning)
        (tool-mount-free)
        
    )
    :effect (and 
        (not (weed-removed ?x))
        (checked-weed-exist ?x)
    )
)

(:action remove_weed 
    :parameters (?x - position) ; while updating the kb, we have to add the instance ?w - w1, w2, w3 etc.
    :precondition (and 
        (farmbot-at ?x)
        ; (farmbot-functioning)
        (carry-tool weeder)
        (weed-at ?x)
    )
    :effect (and 
        (weed-removed ?x)
        (not (weed-at ?x))
        (not (checked-weed-exist ?x))
    )
)

(:action skip_remove_weed
    :parameters (?x - position) ; while updating the kb, we have to add the instance ?w - w1, w2, w3 etc.
    :precondition (and 
        (farmbot-at ?x)
        ; (farmbot-functioning)
        (carry-tool weeder)
        (no-weed-at ?x)
    )
    :effect (and 
        (weed-removed ?x)
        (not (no-weed-at ?x))
        (not (checked-weed-exist ?x))
    )
)



)