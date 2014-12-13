## Homework 3
# Range and Text Widgets

### Outline
In this assignment, students will create a GUI that includes several inputs and updates a log window with their output.

### Interface
Students should create a GUI containing the following elements:

 * A __horizontal scroll-bar__
 * A __progress bar__ beneath the scroll bar
 * A __text line__ (that the user can type in, i.e., that _is not_ read-only)
 * An __"Add Line" button__ next to the text line
 * A __multi-line text box__ (that the user cannot type in, i.e., that _is_ read-only)

The student should reasonably lay out this GUI, and the GUI _must_ resize itself reasonably as the window is resized. The student should ensure that the controls take up all the space in the window (minus appropriate padding), and that this constraint is maintained as the window is resized.

### Events
The student should provide the following events:
 * Whenever the _scroll bar_ is moved, the _progress bar_ should be updated with the value of the scroll-bar. This implies that they should have the same _range_.
 * Whenever the _"Add Line" button_ is clicked, the text that the user has typed in the _text line_ should be appended (on its own line) to the text in the _multi-line text box_.
 * Whenever the user presses enter while typing in the _text line_, the text that the user has typed in the _text line_ should be appended (on its own line) to the text of the _multi-line text box_.