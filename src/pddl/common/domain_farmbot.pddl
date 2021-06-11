(define (domain d-farmbot)


(:requirements 
    :strips 
    :fluents 
    :durative-actions
    :typing 
    ; :timed-initial-literals 
    ; :conditional-effects 
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
    level
    container
    
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (farmbot-functioning)
    (tool-mount-free)
    (farmbot-at ?x - position)
    (carry-tool ?t - tool)
    (visited ?x - position)

    (tool-at ?x - position ?t - tool)
    (tool-rack-at ?t - tool ?x - position)

    (no-plant-at ?x - position)
    (plant-at ?x - position ?p - plant)

    (weed-at ?x - position ?w - weed)


    (carry-seed ?s - seed)
    (container-at ?x - position ?c - container)
    (container-has ?c - container ?s - seed)
    (match-seed-n-plant ?s - seed ?p - plant)

    (not-checked-moisture ?p - plant)
    (checked-moisture ?p - plant)
    (need-water ?p - plant)
    (not-need-water ?p - plant)
    (watered ?p - plant)
)

; (:constants
;     low high - level
;     seeder sprayhead blade camera soil-sensor - tool
; )


; (:functions ;todo: define numeric functions here
; )

; ;define actions here

; (:action move
;     :parameters (?x ?y - position)
;     :precondition (and 
;         (farmbot-at ?x)
;     )
;     :effect (and 
;         (farmbot-at ?y)
;         (not (farmbot-at ?x))
;     )
; )

; (:action pick-up-tool
;     :parameters (?x - position ?t - tool)
;     :precondition (and 
;         (farmbot-at ?x)
;         (tool-at ?x ?t)
;         (tool-mount-free)
;     )
;     :effect (and 
;         (not (tool-at ?x ?t))
;         (carry-tool ?t)
;         (not (tool-mount-free))
;     )
; )

; (:action put-down-tool
;     :parameters (?x - position ?t - tool)
;     :precondition (and 
;         (tool-rack-at ?t ?x)
;         (farmbot-at ?x)
;         (carry-tool ?t)
;     )
;     :effect (and 
;         (tool-mount-free)
;         (tool-at ?x ?t)
;         (not (carry-tool ?t))
;     )
; )


; (:action pick-up-seed
;     :parameters (?x - position ?s - seed ?c - container)
;     :precondition (and 
;         (container-at ?x ?c)
;         (farmbot-at ?x)
;         (container-has ?c ?s)
;         (carry-tool seeder)
;     )
;     :effect (and 
;         (carry-seed ?s)
;     )
; )


; (:action place-seed
;     :parameters (?x - position ?s - seed ?p - plant)
;     :precondition (and 
;         (farmbot-at ?x)
;         (no-plant-at ?x)
;         (carry-seed ?s)
;         (match-seed-n-plant ?s ?p)
;     )
;     :effect (and 
;         (plant-at ?x ?p)
;         (not (carry-seed ?s))
;         (not (no-plant-at ?x))
;     )
; )

; (:action check-need-water
;     :parameters (?x - position ?p - plant)
;     :precondition (and 
;         (not-checked-moisture ?p)
;         (farmbot-at ?x)
;         (plant-at ?x ?p)
;         (carry-tool soil-sensor)
;     )
;     :effect (and 
;         (checked-moisture ?p)
;         (not (not-checked-moisture ?p))
;         ; update the KB in the actual action dispatch and feedback unit
;         ; if the need-water predicate needs to be added, based on the result from the moisture sensor
;     )
; )


; (:action water-plant
;     :parameters (?x - position ?p - plant)
;     :precondition (and 
;         (farmbot-at ?x)
;         (plant-at ?x ?p)
;         (carry-tool sprayhead)
;         (need-water ?p)

;     )
;     :effect (and 
;         (not (need-water ?p))
;         (watered ?p)
;     )
; )

; (:action skip-water-plant
;     :parameters (?x - position ?p - plant)
;     :precondition (and
;         (plant-at ?x ?p)
;         (not-need-water ?p)

;      )
;     :effect (and 
;         (watered ?p)
;     )
; )



; (:action detect-weed
;     :parameters (?x - position ?w - weed)
;     :precondition (and 
;         (carry-tool camera)
;         (farmbot-at ?x)

;     )
;     :effect (and )
; )






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
        (at end (and
            (visited ?y)
        ))
    )
)

; (:durative-action pick-up-tool
;     :parameters (?x - position ?t - tool)
;     :duration (= ?duration 10)
;     :condition (and 
;         (at start (and 
;             (tool-at ?x ?t)
;             (tool-mount-free)
;         ))
;         (over all (and 
;             (farmbot-at ?x)
;             (farmbot-functioning)
;         ))
;     )
;     :effect (and 
;         (at end (and 
;             (not (tool-at ?x ?t))
;             (carry-tool ?t)
;             (not (tool-mount-free))
;         ))
;     )
; )

; (:durative-action put-down-tool
;     :parameters (?x - position ?t - tool)
;     :duration (= ?duration 10)
;     :condition (and 
;         (at start (and 
;             (carry-tool ?t)
;         ))
;         (over all (and 
;             (tool-rack-at ?t ?x)
;             (farmbot-at ?x)
;             (farmbot-functioning)
;         ))
;     )
;     :effect (and 
;         (at end (and 
;             (tool-mount-free)
;             (tool-at ?x ?t)
;             (not (carry-tool ?t))

;         ))
;     )
; )

; (:durative-action pick-up-seed
;     :parameters (?x - position ?s - seed ?c - container)
;     :duration (= ?duration 10)
;     :condition (and 
;         (at start (and 
;             (container-has ?c ?s)
;         ))
;         (over all (and 
;             (container-at ?x ?c)
;             (farmbot-at ?x)
;             (farmbot-functioning)
;             (carry-tool seeder)
;         ))
;     )
;     :effect (and 
;         (at end (and 
;             (carry-seed ?s)
;         ))
;     )
; )

; (:durative-action place-seed
;     :parameters (?x - position ?s - seed ?p - plant)
;     :duration (= ?duration 10)
;     :condition (and 
;         (at start (and 
;             (no-plant-at ?x)
;             (carry-seed ?s)
;         ))
;         (over all (and 
;             (farmbot-at ?x)
;             (match-seed-n-plant ?s ?p)
;             (farmbot-functioning)
;         ))
;     )
;     :effect (and 
;         (at end (and 
;             (plant-at ?x ?p)
;             (not (carry-seed ?s))
;             (not (no-plant-at ?x))
;         ))
;     )
; )





)