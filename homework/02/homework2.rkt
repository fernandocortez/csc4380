#lang racket/gui
(require racket/gui/base)

; Make a frame by instantiating the frame% class
(define frame
  (new frame%
       [label "Homework 2"]
       ; Frame is no less than 400 pixels wide
       [min-width 400]
       ; Frame is no less that 300 pixels high
       [min-height 300]))

; Top horizontal panel
(define top (new horizontal-panel% [parent frame]))
; Create panel within top panel that aligns its elements to left, top
(define top-left (new horizontal-panel% [parent top]
                      [alignment `(left top)]))

; Creates radio-box with two options
(define radio (new radio-box% [parent top-left]
     [label #f]
     [choices (list "Left" "Right")]
     ; No radio is selected by default
     [selection #f]
     ; Arranges the radio button horizontally
     [style `(horizontal)]))

; Make a button in the frame
(define button (new button% [parent frame]
     [label "Click Me"]
     ; Callback procedure for a button click
     (callback (lambda (button event)
                 (send msg set-label (get-message (send radio get-selection)))))))

; Determines which of the radio buttons is select, returning the appropriate message
(define get-message
  (lambda (x)
    ; First checks if input is boolean. Otherwise error is thrown on integer comparison
    ; Getting radio selection returns #f if none selected
    (cond ((boolean? x) "")
          ; Radio buttons are zero based. Left radio is first option
          ((= x 0) "Left")
          ; Last possible state is for right radio to be selected
          (else "Right"))))

; Create a panel at the bottom that is a child of the frame
(define bottom (new horizontal-panel% [parent frame]))
; Create panel within bottom panel that aligns its elements to left, bottom
(define bottom-left (new horizontal-panel% [parent bottom]
                         [alignment `(left bottom)]))
; Create panel within bottom panel that aligns its elements to right, bottom
(define bottom-right (new horizontal-panel% [parent bottom]
                          [alignment `(right bottom)]))

; Check-box to enable/disable center button
(define check-box (new check-box% [parent bottom-left]
     [label "Enable button?"]
     ; Box is initialized as checked
     [value #t]
     ; Callback procedure to enable/disable center button
     [callback (lambda (check-box event)
                 ; When there is a check-box event (i.e., check/uncheck), send
                 ; the value of the check-box to the enable option of the button
                 (send button enable (send check-box get-value)))]))

; Make a static text message in the frame
(define msg (new message% [parent bottom-right]
                 [label "No events so far..."]))

; Show the frame by calling its show method
(send frame show #t)