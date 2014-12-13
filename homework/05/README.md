## Homework 5
# Custom Events
due before class on __Friday, October 31st__

### Outline
In this assignment, students will create a complex, composite GUI that uses several custom widgets and is wired together with custom events.

### Interface
Students will create three widgets:

A _text_ widget, which contains:
 * a text line (that is writable)
 * a "submit" button

A _point_ widget, which contains:
 * an "x-value" slider
 * a "y-value" slider
 * a "submit" button

A _main window_ widget, which contains:
 * a _text widget_
 * a _point widget_
 * a multi-line text box

The application should display the _main window_ widget when it starts.

The _text widget_ should have a `getDataAsText` function which returns the text in the text line; the _point widget_ should have a `getDataAsText` function which returns a string that contains the values in the sliders.

### Events
_Text widgets_ should have a "text submitted" event; this event should be triggered when the "submit" button in the text widget is clicked.

_Point widgets_ should have a "point submitted" event; this event should be triggered when the "submit button" in the point widget is clicked.

Whenever the text widget in the _main window_ raises its _"value submitted"_ event, the `getDataAsText` function should be called, and the string that it generates should be added to the contents of the multi-line text box on its own line. Similarly, whenever the point widget in the _main window_ raises its "value submitted" event, the `getDataAsText` function should be called, and the string that it generates should be added to the multi-line text box on its own line.
