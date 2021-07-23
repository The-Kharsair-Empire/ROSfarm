(define (problem test-unity) (:domain d-farmbot)
(:objects 
    A1 A2 A3 A4 A5 A0 - position
)

(:init
    (farmbot-functioning)
    (farmbot-at A0)
    ;todo: put the initial state's facts and numeric values here
)

(:goal (and
    (visited A1)
    (visited A2)
    (visited A3)
    (visited A4)
    (visited A5)
    (farmbot-at A5)
    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
