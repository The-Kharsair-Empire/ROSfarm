(define (problem task)
(:domain d-temporal-bot-visiting)
(:objects
    loc1_1 loc1_2 loc2_1 loc2_2 - place
)
(:init
    (connected loc1_1 loc1_2)
    (connected loc1_2 loc1_1)
    (connected loc1_2 loc2_1)
    (connected loc2_1 loc1_2)
    (connected loc2_1 loc2_2)
    (connected loc2_2 loc2_1)



    (visited loc1_1)

)
(:goal (and
    (visited loc2_2)
))
)
