# Readme

Put a brief description of your code here. This should at least describe the file structure.
The GradReflect project code builds an iOS app on either the simulator or a connected iOS mobile device.
The app take the user to a home page with 

### Model
The model classes within SwiftUI are used as a data container that define a structure that will be written to and fetched from. 
This includes the SkillModel and RecordingModel.
The SkillModel defines the structure of the data that is contained for each skill on the app's skill cards.
The RecordingModel defines the structure of what is held for the recordings created by the app. This data is used to fetch and display recordings.

A model, NoteEntry, was also created to hold the note entries created by the user via Core Data, the permanent storage that organises the data in an entity-attribute relationship. It has a Core Data class file and a Core Data properties file. It allowed the manipulation of data within the fetch request in a single line of code, and tracked changes through the persistent storage. Core Data is saved using an NSManagedObject which uses optimised storage and retrieval methods with key-value coding and observing.

### Data
The Data folder contains one swift file called SkillData, this uses the SkillModel to strucutre and populate the data that is displayed on the skill cards.

### View
The view folder contains a file for each of the major UI components. The view is responsible for displaying the UI and animations. A secondary responsibility of the view is to receive any user interactions and pass these to a view model for interpretation. The view is made up of views and controls; each view represents a building block of user interface. The controls allow the user to interact with this interface. 
There is also a RootView that is involved in dictating which view is being shown at a given time by using the enum created in the PageHelper.

### App
The App folder has the files that control the views or data.
There is the GradReflect.xcdatamodel file that contains the creation of Core Data NoteEntry and its attributes. 
The GradReflectApp file is what opens upon running the app, it calls the RootView to decide what view is shown at a given time.
The ability to switch views is controlled by the Rooter and PageHelper files. The Rooter starts the application on the skill cards home page, the PageHelper file uses an enum that provides the different view options that are selected when the user presses the navaigation buttons to enter a different page view.
A persistence file controls the settings for Core Data.
The NotificationManager controls the notification that are launched when the users clicks the button to turn on notifications with the Settings page.
The RecordAudio file handles the functionality for recording an audio in the Recordings page.
The PlaybackAudio file handles the functionality for playing back an audio created by a user within the Recordings page.

### Assets 
The Assests.xcassets holds the images that are used throughout the app including the application logo and loading screen, as well as all the images for the skill cards.

### Info.plist
This holds the settings for the application.

### UI tests
Within the UI tests there are two tests.
The first test creates a new note and saves this.
The next test then deletes this note.
These tests need to be run in order and are run through clicking the play button next to the class declaration "class GradReflectUITests: XCTestCase".

## Build instructions

**You must** include the instructions necessary to build and deploy this project successfully. If appropriate, also include 
instructions to run automated tests. 

### Requirements

Apple Account to build the app on their own device.

List the all of the pre-requisites software required to set up your project (e.g. compilers, packages, libraries, OS, hardware)

For example:

* Python 3.7
* Packages: listed in `requirements.txt` 
* Tested on Windows 10

or another example:

* Requires Raspberry Pi 3 
* a Linux host machine with the `arm-none-eabi` toolchain (at least version `x.xx`) installed
* a working LuaJIT installation > 2.1.0

### Build steps

To build the app, the simulated iPhone can be used. To do this the large Play button on the toolbar at the top of XCode should be pressed after choosing the iOS device to build the app on. iPhone 11 Pro is recommended as this was the phone that was used during the majority of development. 
The app can then be interacted with as it will build onto the simulated device in the same way it would on a physical device. The app can be interacted with using the mouse and keyboard to type.

To build the app on a physical iPhone, the user must connect their iPhone to the Apple computer being used. 
The must then request their certificates by going to the preferences tab in XCode and then to Accounts. They must then fill in their Apple ID account information.


List the steps required to build software. 

Hopefully something simple like `pip install -e .` or `make` or `cd build; cmake ..`. In
some cases you may have much more involved setup required.

### Test steps

List steps needed to show your software works. This might be running a test suite, or just starting the program; but something that could be used to verify your code is working correctly.

The application can be tested through the use of the previews that are provided next to the code for each of the views that can be run through the play button on the preview to use the functionality on a particular view.

The app can also be tested through running the application via the simulated iPhone device. To run this the Play button at the top toolbar of XCode must be pressed after selecting the type of iPhone that should be used. iPhone 11 Pro is recommended as this was the phone that was used during the majority of development.

There are also two UI tests that can be run by clicking the play button next to the class declaration "class GradReflectUITests: XCTestCase". These tests will open the simulated iPhone to run them and test that a notes can be created and deleted. While the tests are running the simulated phone should not be intereacted with as this will interrupt the tests and cause them to fail.
