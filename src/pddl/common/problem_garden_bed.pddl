(define (problem garden-bed) (:domain d-farmbot)
(:objects 
    init posSeedTray A1 A2 A3 A4 A5 A6 A7 - position
    carrotSeed basilSeed parsleySeed - seed
    carrot basil parsley - plant
)

(:init
    (farmbot-functioning)
    (farmbot-at init)
    (carry-camera)
    (tool-mount-free)

    (container-at posSeedTray seedtray)
    (container-has seedtray carrotSeed)
    (container-has seedtray carrotSeed)                              
    (container-has seedtray basilSeed)
    (container-has seedtray parsleySeed)

    (match-seed-n-plant carrotSeed carrot)
    (match-seed-n-plant basilSeed basil)
    (match-seed-n-plant parsleySeed parsley)

    (no-plant-at A1)


    ;todo: put the initial state's facts and numeric values here
)

(:goal (and
    ;todo: put the goal condition here
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
