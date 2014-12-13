## Homework 6
# Custom Painting and Background Jobs
due before class on __Friday, November 21st__

### Outline
In this assignment, students will create a widget that provides a custom drawing method and a custom event, and will use that widget to build a GUI that manages a background thread.

### The ThreadControl Widget
Students will create a custom `ThreadControl` widget, which will use a custom rendering method. The widget will have multiple _states_; how it renders itself will depend on what state the widget is in. In each of its states, the widget will render a _rectangle_ in a given color centered in its allocation, and some _text_ centered in that rectangle. When the widget is in the _ready_ state, the rectangle should be _green_, and the text should be "Ready"; when the widget is in the _running_ state, the rectangle should be _yellow_ and the text should read "Running".

The student will add a `StartRequested` _event_ to this widget. When the widget is _clicked_, if it is in the _ready_ state, it should generate a `StartRequested` event. If the widget is clicked and it is in the _running_ state, it should do nothing.

The widget should not change states on its own; instead, some other component will later connect to the `StartRequested` event, and change the `ThreadControl` widget's state when appropriate. To support this, the student should add a `setState` function, which takes one of the widget's _states_ as an argument. (The student will likely want to represent the widget's _states_ as an enumeration type, for ease of use.) This function should allow the caller to switch the widget between its _ready_ and _running_ states. (The name of this function is not important; in particular, if widgets in the student's platform already have a `setState` function, then the student should probably use a different name for this state-control function, like `setControlState` or `showThreadState`.)

Note that, to get this widget to work correctly, you will likely also have to override some sizing and layout functions to provide appropriate sizing data for your widget. The different texts will have different sizes; if possible, the student should return a consistent size in all the widget's states (so that it doesn't resize when the state changes), and that state should be large enough to accommodate the largest text that the widget might display. (The student can just return one "sufficiently large" size request if they wish.)

### The Main Window
The student should create a _main window_ GUI, which will contain a ThreadControl widget and progress bar, and will manage a worker thread.

The _worker thread_ should likely be represented by a `BackgroundWorker` or an analogous class. When it is _run_, the thread should sleep for ten seconds, in one second intervals; after every one-second sleep, it should report its progress appropriately (that is, ten percent progress per one second sleep).

When the `ThreadControl` widget raises that StartRequested event, the `MainWindow` should start the _worker thread_, and it should set the `ThreadControl` widget's state to _running_. When the _worker thread_ reports its progress, the _progress bar_ should be updated with that progress. When the _worker thread_ reports that it is finished, the `ThreadControl` should be switched back to the _ready_ state.

### Special Per-Platform Instructions
This homework, more than many others, may require significant adaptation to the specific platform that the student is using. On WPF or Qt, the project should require little adaptation; for Java Swing, the major issue might be that Swing's SwingWorker is not re-usable, so the student will need to create a new SwingWorker each time the `ThreadControl` widget raises the `StartRequested` event.

For other platforms, particularly mobile platforms, extensive adaptation might be needed. If the student's preferred platform does not provide functionality that this assignment uses, the student should contact the professor.

### Bonus
This homework will include a bonus. Homework is normally graded 
on a 1-to-10 scale; this bonus will provide an additional 5 points. (Note that the exact impact that this will have on the student's final grade depends on what percentage of the final grade is determined by the homeworks, and on how many homeworks that there are.)

For the bonus, the student should add an additional state (the _cancelling_ state) and an additional event (the `CancelRequested` event) to the `ThreadControl` widget. In the _cancelling_ state, the rectangle, (in the `ThreadControl` widget) should be _yellow_ and the text should read "Cancelling". When the `ThreadControl` widget is in the Running state, if it is clicked, it should raise the `CancelRequested` event.
