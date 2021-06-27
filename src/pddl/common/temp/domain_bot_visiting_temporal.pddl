; ;Header and description

(define (domain d-temporal-bot-visiting)

;remove requirements that are not needed
(:requirements 
    :strips 
    :fluents 
    :durative-actions
    ;:timed-initial-literals 
    :typing 
   ; :conditional-effects 
    ;:negative-preconditions 
   ; :duration-inequalities 
    ;:equality
    
)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    place - object
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (connected ?x ?y - place)
    (robot-functioning)
    (at-robot ?x - place)
    (visited ?x -place)
)


(:functions ;todo: define numeric functions here
)

;define actions here

(:durative-action move
    :parameters (?curpos ?nextpos - place)
    :duration (= ?duration 20)
    :condition (and 
        (at start (and 
            (at-robot ?curpos) 
            (connected ?curpos ?nextpos)
        ))
        (over all (and 
            (robot-functioning)
        ))
    )
    :effect (and 
        (at start (and 
            (not (at-robot ?curpos))
        ))
        (at end (and 
            (visited ?nextpos)
            (at-robot ?nextpos)
        ))
    )
)


)
