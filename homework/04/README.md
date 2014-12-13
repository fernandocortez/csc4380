## Homework 4
# Composite Widgets

### Outline
In this assignment, students will create a complex, composite GUI that is similar to a simple text editor.

### Interface
Students will create two GUI components: a widget similar to a text document and a widget similar to an application window.

The _document_ widget should contain the following:
 * an "Open" button in the bottom-left corner of the widget
 * a scroll-viewer taking up all the remaining space in the widget (minus any horizontal space next to the button)
 * a multi-line text control inside the scroll-viewer

The _application window_ widget should contain the following:
 * an "Add" push-button in the bottom-left corner
 * a "Type" combo-box next to the push-button
 * a tab-manager that takes up the rest of the widget (minus any horizontal space next to the buttons)

The "type" combo-box should have two (text) options, "document" and "window".

### Events
When the "Open" button is clicked, the application should display a _file-selection dialog box_. If the user selects a file, the _file path_ that the user selected should then be displayed in a _warning dialog box_. If the user does not select a file (e.g., they cancel the file selection dialog), then nothing should happen. _The student does not need to actually open the file the user picks_.

When the "Add" push-button in the application window is clicked, the student's application should check the current selection in the combo-box. If "document" is selected, a new tab should be added to that application window's tab manager; that tab should contain a single _document_ widget as a child. If "window" was selected, however, the application should create a new _application window_ widget (in its window).