#lang racket/gui

(define frame
  (new frame%
       [label "Homework 6"]
       [min-width 600]
       [min-height 400]))

(define ThreadControl
  (lambda (childOf gauge)
  
  (define container
    (new horizontal-panel%
         [parent childOf]
         [vert-margin 5]
         [horiz-margin 5]
         [spacing 5]
         [alignment '(center center)]
         [stretchable-width #t]
         [stretchable-height #t]))
  
  (new button%
       [label "Start Thread"]
       [parent container]
       [stretchable-width #t]
       [stretchable-height #t])))

(define gauge
  (new gauge%
       [label #f]
       ; Max value of gauge
       [range 10]
       [parent frame]
       [horiz-margin 5]
       [vert-margin 5]
       [stretchable-width #t]))

(ThreadControl frame gauge)

(send frame show #t)
