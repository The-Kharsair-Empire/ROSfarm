(define (problem task)
(:domain d-farmbot)
(:objects
    a1 a2 a3 a4 a5 a0 - position
    seeder wateringnozzle weeder soilsensor - tool
    low high - level
    seedtray - container
)
(:init
    (farmbot-functioning)


    (farmbot-at a0)


















)
(:goal (and
    (visited a1)
    (visited a2)
    (visited a3)
    (visited a4)
    (visited a5)
    (farmbot-at a5)
))
)
