##Homework 2
#Buttons and Callbacks

###Outline
In this assignment, students will create a GUI that displays a label and several buttons -- a push-button, a check-box and two radio buttons -- and connect simple callbacks to some of them.

###Interface
Students should create a GUI containing the following elements:
 * a label in the lower, right corner of the GUI
 * a check-box in the lower, left corner of the GUI
 * a radio button in the upper right corner of the GUI
 * a radio button in the upper left corner of the GUI
 * a push-button in the center of the GUI

Each component should maintain its positioning as the window is resized –- that is, the push-button should stay in the center of the screen, and the other four components should stay in their respective corners.

The students should ensure that the two radio buttons are grouped, so that only one can be selected at a time.

###Events
Students should attach the following events:
 * when the check-box is checked, the push-button should be *enabled*,
 * when the check-box is un-checked, the push-button should be *disabled*, and
 * when the push-button is clicked, it should print which of the radio buttons is selected. (Printing “left” or “right” is sufficient. If no radio button is selected, nothing should be printed. If the push-button is disabled, then clicking it will produce no output.)