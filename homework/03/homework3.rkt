#lang racket/gui

; Make a frame by instantiating the frame% class
(define frame
  (new frame%
       [label "Homework 3"]
       ; Frame is no less than 640 pixels wide
       [min-width 640]
       ; Frame is no less than 400 pixels high
       [min-height 400]))

(define slider (new slider%
                    [label #f]
                    [font (make-font #:size 14)]
                    ; Min value matches that of gauge
                    [min-value 0]
                    ; Max value matches that of gauge
                    [max-value 100]
                    [parent frame]
                    ; Stretches gauge of width to that of parent frame
                    [stretchable-width #t]
                    ; Adds margin to top and bottom
                    [vert-margin 5]
                    ; Adds margin to left and right
                    [horiz-margin 5]
                    ; Sets value of gauge when slider is adjusted
                    (callback (lambda (slider event)
                                (send gauge set-value (send slider get-value))))))

(define gauge (new gauge%
                   [label #f]
                   [font (make-font #:size 14)]
                   ; Min value automatically set to zero
                   ; Max value of gauge matches that of slider
                   [range 100]
                   [parent frame]
                   ; Stretches gauge of width to that of parent frame
                   [stretchable-width #t]
                   ; Adds margin to top and bottom
                   [vert-margin 5]
                   ; Adds margin to left and right
                   [horiz-margin 5]))

; Horizontal pane organizes children into columns
(define input-pane (new horizontal-pane%
                         [parent frame]
                         ; Aligns children elements to right, center
                         [alignment '(right center)]
                         ; Stretches width of pane to that of parent frame
                         [stretchable-width #t]
                         ; Keeps the height from stretching
                         [stretchable-height #f]
                         ; Adds margin to top and bottom
                         [vert-margin 5]
                         ; Adds margin to left and right
                         [horiz-margin 5]))

(define textfield (new text-field%
                       [label #f]
                       [parent input-pane]
                       [font (make-font #:size 14)]
                       ; Text field is set to single line height
                       [style '(single)]
                       ; Stretches width of text field to that of parent frame
                       [stretchable-width #t]))

(define button (new button%
                    [parent input-pane]
                    [label "Add Line"]
                    [font (make-font #:size 14)]
                    ; When the textfield is focused, the style of border executes the
                    ; button's callback when the user presses enter
                    [style '(border)]
                    (callback (lambda (button event)
                                ; Gets value of textfield and sends to text object,
                                ; appending a new line escape sequence to the value
                                (send text insert
                                      (string-append (send textfield get-value) "\n"))
                                ; Clears textfield after adding text to canvas
                                (send textfield set-value "")
                                ; Focuses the textfield after adding text to canvas
                                (send textfield focus)))))

; Text editor that is being managed and displayed on editor canvas below
(define text (new text%
                  [auto-wrap #t]))

; Displays and manages text editor above
(define textarea (new editor-canvas%
                      [parent frame]
                      ; Sets the canvas to be a text editor
                      [editor text]
                      ; Disables horizontal scroll bar, vertical scroll bar only appears
                      ; when needed, and area cannot receive focus (i.e., not editable)
                      [style '(no-hscroll auto-vscroll no-focus)]
                      ; Stretches width to that of parent frame
                      [stretchable-width #t]
                      ; Stretches height to take up remaining vertical space
                      [stretchable-height #t]
                      ; Adds margin to top and bottom
                      [vert-margin 5]
                      ; Adds margin to left and right
                      [horiz-margin 5]))

; Show frame by calling its show method
(send frame show #t)
