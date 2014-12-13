#lang racket/gui

; Make a frame by instantiating the frame% class
(define frame
  (new frame%
       [label "Homework 4"]
       ; Frame is no less than 640 pixels wide
       [min-width 640]
       ; Frame is no less than 400 pixels high
       [min-height 400]))

(define application-window
  (new vertical-panel%
       [parent frame]
       [stretchable-width #t]
       [stretchable-height #t]))

(define tab-panel
  (new tab-panel%
       [parent application-window]
       [choices (list "Tab 0")]
       [stretchable-width #t]
       [stretchable-height #t]))

(define application-controls
  (new horizontal-panel%
       [parent application-window]
       [stretchable-width #t]
       [stretchable-height #f]))

(define new-widget
  (new button%
       [parent application-controls]
       [label "Add"]))

(define combo-field
  (new choice%
       [parent application-controls]
       [label #f]
       [choices (list "document"
                      "window")]))

(define document-widget
  (new vertical-panel%
       [parent tab-panel]
       [stretchable-width #t]
       [stretchable-height #t]))

(define textarea
  (new text-field%
       [label #f]
       [parent document-widget]
       [style '(multiple)]
       [font (make-font #:size 14)]
       [stretchable-width #t]
       [stretchable-height #t]))

(define bottom-panel
  (new horizontal-panel%
       [parent document-widget]
       [stretchable-width #t]
       [stretchable-height #f]))

(define open
  (new button%
       [parent bottom-panel]
       [label "Open"]))

; Show frame by calling its show method
(send frame show #t)