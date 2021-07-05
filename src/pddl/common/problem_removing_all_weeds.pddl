(define (problem p-remove-weed) (:domain c-d-farmbot)
(:objects 
    home A1 A2 A3 A4 A5 A6 A7 - position
    weed1 weed2 weed3 weed4 - weed

)

(:init

    (farmbot-at home)
    (farmbot-functioning)
    (carry-camera)
    (tool-mount-free)

    (tool-rack-at weederrack weeder weederPos)
    (tool-at weederPos weeder)

    (weed-at A2 weed1)
    (weed-at A3 weed2)
    (weed-at A4 weed3)
    (weed-at A6 weed4)

)

(:goal (and
    (no-weed-at A2)
    (no-weed-at A3)
    (no-weed-at A4)
    (no-weed-at A6)
    (tool-mount-free)
    (farmbot-at home)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
