#lang racket/gui

; Make a frame by instantiating the frame% class
(define frame
  (new frame%
       [label "Homework 5"]
       ; Frame is no less than 640 pixels wide
       [min-width 640]
       ; Frame is no less than 400 pixels high
       [min-height 400]))

(define text-widget
  ; @param childOf - Parent of this widget instance
  ; @param text - Object to where text of text area goes
  (lambda (childOf text)
    
    ; Wrapper for this widget
    (define wrapper
      (new vertical-panel%
         [parent childOf]
         [alignment '(left center)]
         [stretchable-width #t]
         [stretchable-height #f]
         [vert-margin 5]
         [horiz-margin 5]))
    
    (define textfield
      (new text-field%
           [label "Text Widget"]
           [parent wrapper]
           [style '(single vertical-label)]
           [stretchable-width #t]))
    
    (new button%
         [label "Submit"]
         [parent wrapper]
         ; When then text-field is focused, the style of border of the
         ; button executes the button's callback when the user presses
         ; the enter button
         [style '(border)]
         (callback (lambda (button event)
                     (send text insert
                           (string-append (send textfield get-value) "\n"))
                     (send textfield set-value "")
                     (send textfield focus))))))

(define point-widget
  ; @param childOf - Parent of this widget instance
  ; @param text - Object to where text of text area goes
  (lambda (childOf text)
    (define wrapper
      (new vertical-panel%
           [parent childOf]
           [alignment '(left center)]
           [stretchable-width #t]
           [stretchable-height #f]
           [vert-margin 5]
           [horiz-margin 5]))
    
    (define title
      (new message%
           [label "Point Widget"]
           [parent wrapper]
           [font (make-font #:size 12)]))
    
    (define x-value
      (new slider%
           [label "X"]
           [min-value 0]
           [max-value 100]
           [parent wrapper]
           [stretchable-width #t]))
    
    (define y-value
      (new slider%
           [label "Y"]
           [min-value 0]
           [max-value 100]
           [parent wrapper]
           [stretchable-width #t]))
    
    (new button%
         [label "Submit"]
         [parent wrapper]
         (callback (lambda (button event)
                     (send text insert
                           (string-append "(x:"
                                          ; ~a convert number to string
                                          (~a (send x-value get-value))
                                          ", y:"
                                          ; ~a convert number to string
                                          (~a (send y-value get-value))
                                          ")\n")))))))

(define main-widget
  ; @param childOf - Parent of this widget instance
  (lambda (childOf)
    ; Text editor that is being managed and displayed on editor canvas below
    (define text 
      (new text%
           [auto-wrap #t]))
    
    ; Adds instance of text-widget to frame
    (text-widget childOf text)

    ; Adds instance of point-widget to frame
    (point-widget childOf text)

    ; Displays and manages text editor above
    (new editor-canvas%
         [parent childOf]
         ; Sets the canvas to be a text editor
         [editor text]
         ; Disables horizontal scroll bar, vertical scroll bar only
         ; appears when needed, and area cannot receive focus
         ; (i.e., not editable)
         [style '(no-hscroll auto-vscroll no-focus)]
         ; Stretches width to that of parent frame
         [stretchable-width #t]
         ; Stretches height to take up remaining vertical space
         [stretchable-height #t]
         ; Adds margin to top and bottom
         [vert-margin 5]
         ; Adds margin to left and right
         [horiz-margin 5])))

; Create a main widget in the frame
(main-widget frame)

; Show frame by calling its show method
(send frame show #t)
